param prefix string = ''

var uniqueStorageName = '${prefix}stg${uniqueString(resourceGroup().id)}'

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = if (!empty(prefix)) {
  name: uniqueStorageName
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
