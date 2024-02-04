//set sprite when attacking?

if hp <= 0 {scrEDead();}

//movement behavior
switch (behavior) {
    case "static": scrEStateStatic(); break;
    case "patrolL": scrEStatePatrolL(); break; //patrol counterclockwise
    case "patrolR": scrEStatePatrolR(); break; //patrol clockwise
    case "wander": break;
    case "wallHug": break; //dog/SWAT pathing AI
    default: break;
}