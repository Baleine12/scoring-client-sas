/* Projet SAS : scoring client */
/* Objectif : construire un score simple de risque de depart client */

/* Creation d'une base client simulee */

data clients;
    call streaminit(42);

    do id_client = 1 to 1000;

        age = rand("integer", 18, 75);

        revenu = round(rand("normal", 2800, 850), 1);
        if revenu < 900 then revenu = 900;

        anciennete = rand("integer", 1, 120);
        satisfaction = rand("integer", 1, 10);
        reclamations = rand("integer", 0, 7);
        utilisation = rand("integer", 1, 30);

        x = rand("uniform");

        if x < 0.50 then contrat = "Mensuel";
        else if x < 0.80 then contrat = "Annuel";
        else contrat = "Deux_ans";

        /* construction d'un risque de depart */
        score = -1
                + 0.20 * reclamations
                - 0.18 * satisfaction
                - 0.01 * anciennete
                - 0.02 * utilisation
                + 0.00005 * revenu;

        if contrat = "Mensuel" then score = score + 0.50;
        if contrat = "Deux_ans" then score = score - 0.40;

        proba_churn = 1 / (1 + exp(-score));

        u = rand("uniform");
        if u < proba_churn then churn = 1;
        else churn = 0;

        output;
    end;

    drop x u score;
run;


/* Apercu rapide de la base */

proc print data=clients(obs=10);
    title "Apercu des premieres lignes";
run;


/* Statistiques descriptives */

proc means data=clients mean std min max;
    var age revenu anciennete satisfaction reclamations utilisation;
    title "Statistiques descriptives";
run;


/* Repartition du churn */

proc freq data=clients;
    tables churn;
    title "Repartition de la variable churn";
run;


/* Quelques croisements simples */

proc freq data=clients;
    tables contrat*churn / chisq;
    title "Churn selon le type de contrat";
run;

proc means data=clients mean;
    class churn;
    var age revenu anciennete satisfaction reclamations utilisation;
    title "Moyennes des variables selon le churn";
run;


/* Modele logistique */

proc logistic data=clients descending;
    class contrat (ref="Deux_ans") / param=ref;
    model churn = age revenu anciennete satisfaction reclamations utilisation contrat;
    output out=resultats predicted=score_churn;
    title "Modele logistique du churn client";
run;


/* Creation de classes de risque */

data resultats;
    set resultats;

    if score_churn < 0.30 then risque = "Faible";
    else if score_churn < 0.60 then risque = "Moyen";
    else risque = "Eleve";
run;


/* Verification des scores obtenus */

proc freq data=resultats;
    tables risque*churn;
    title "Churn observe selon la classe de risque";
run;

proc means data=resultats mean min max;
    var score_churn;
    title "Resume du score de churn";
run;


/* Export des fichiers */

proc export data=clients
    outfile="donnees/clients_simules.csv"
    dbms=csv
    replace;
run;

proc export data=resultats
    outfile="sorties/resultats_scoring.csv"
    dbms=csv
    replace;
run;