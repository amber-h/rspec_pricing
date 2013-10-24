class ListofMaterials
	$materialsMarkup = {}
	$materialsMarkup[:pharmaceuticals] = 0.075
	$materialsMarkup[:food] = 0.13
	$materialsMarkup[:electronics] = 0.02
	$materialsMarkup[:other] = 0

	$foodTypes = []
	$foodTypes.push('food')
	$foodTypes.push('pizza')

	$pharmaceuticalTypes = []
	$pharmaceuticalTypes.push('drugs')
	$pharmaceuticalTypes.push('pharmaceuticals')

	$electronicsTypes = []
	$electronicsTypes.push('electronics')
	$electronicsTypes.push('computers')
end