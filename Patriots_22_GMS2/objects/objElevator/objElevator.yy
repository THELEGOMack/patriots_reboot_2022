{
  "resourceType": "GMObject",
  "resourceVersion": "1.0",
  "name": "objElevator",
  "eventList": [
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":8,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":0,"eventType":2,"isDnD":false,},
    {"resourceType":"GMEvent","resourceVersion":"1.0","name":"","collisionObjectId":null,"eventNum":1,"eventType":2,"isDnD":false,},
  ],
  "managed": true,
  "overriddenProperties": [],
  "parent": {
    "name": "Elevator",
    "path": "folders/Objects/Elevator.yy",
  },
  "parentObjectId": {
    "name": "objPlayerClip",
    "path": "objects/objPlayerClip/objPlayerClip.yy",
  },
  "persistent": false,
  "physicsAngularDamping": 0.1,
  "physicsDensity": 0.5,
  "physicsFriction": 0.2,
  "physicsGroup": 1,
  "physicsKinematic": false,
  "physicsLinearDamping": 0.1,
  "physicsObject": false,
  "physicsRestitution": 0.1,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsShapePoints": [],
  "physicsStartAwake": true,
  "properties": [
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"startOpen","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"False","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"goingUp","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"value":"True","varType":3,},
    {"resourceType":"GMObjectProperty","resourceVersion":"1.0","name":"floorSprite","filters":[],"listItems":[],"multiselect":false,"rangeEnabled":true,"rangeMax":6.0,"rangeMin":0.0,"value":"0","varType":1,},
  ],
  "solid": false,
  "spriteId": {
    "name": "sprElevator",
    "path": "sprites/sprElevator/sprElevator.yy",
  },
  "spriteMaskId": {
    "name": "sprElevatorMask",
    "path": "sprites/sprElevatorMask/sprElevatorMask.yy",
  },
  "visible": true,
}