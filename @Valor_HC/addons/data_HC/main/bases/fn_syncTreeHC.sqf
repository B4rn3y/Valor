private _tree = param [0, objNull, [objNull]];
if(isNull _tree)exitWith{};
if(isNil "valor_deadTrees")then{
	valor_deadTrees = [];
};
valor_deadTrees pushBackUnique _tree;