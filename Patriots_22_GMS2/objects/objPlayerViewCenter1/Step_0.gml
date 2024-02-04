//get player and cursor position values
_pX = objPlayer.x;
_pY = objPlayer.y;
_cX = objEffector.x;
_cY = objEffector.y;

_len = point_distance(_pX, _pY, _cX, _cY);
_dir = point_direction(_pX, _pY, _cX, _cY);

x = _pX + (lengthdir_x(_len, _dir)*0.4);
y = _pY + (lengthdir_y(_len, _dir)*0.4);

_xx = x + (lengthdir_x(_len, _dir)*0.8);
_yy = y + (lengthdir_y(_len, _dir)*0.8);