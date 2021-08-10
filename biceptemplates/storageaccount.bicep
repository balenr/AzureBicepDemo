@maxLength(11)
param prefix string = 'bicep'

var uniqueStorageName = '${prefix}sta${uniqueString(resourceGroup().id, subscription().id)}'

resource stg 'Microsoft.Storage/storageAccounts@2021-02-01' = if (!empty(prefix)) {
  name: uniqueStorageName
  location: resourceGroup().location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}
