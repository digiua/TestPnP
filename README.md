# TestPrinterPnP-net47

### Error de Ejecución

    C:\Users\ganzo\Documents\Development\TestPrinterPnP-net47> dotnet run TestPrinterPnP-net47.csproj -r win-x86 "13"   
    C:\Program Files\dotnet\sdk\6.0.101\Microsoft.Common.CurrentVersion.targets(2304,5): warning MSB3246: El archivo resuelto tiene una imagen incorrecta, no tiene metadatos o no es posible su acceso. System.BadImageFormatException: No se puede abrir el archivo de ensamblado "C:\Users\ganzo\Documents\Development\TestPrinterPnP-net47\pnpdll.dll". La imagen PE no contiene metadatos administrados. [C:\Users\ganzo\Documents\Development\TestPrinterPnP-net47\TestPrinterPnP-net47.csproj]
    C:\Program Files\dotnet\sdk\6.0.101\Microsoft.Common.CurrentVersion.targets(2304,5): warning MSB3246:    at Microsoft.Build.Shared.AssemblyNameExtension.GetAssemblyNameEx(String path) [C:\Users\ganzo\Documents\Development\TestPrinterPnP-net47\TestPrinterPnP-net47.csproj]
    C:\Program Files\dotnet\sdk\6.0.101\Microsoft.Common.CurrentVersion.targets(2304,5): warning MSB3246:    at Microsoft.Build.Tasks.SystemState.GetAssemblyName(String path) [C:\Users\ganzo\Documents\Development\TestPrinterPnP-net47\TestPrinterPnP-net47.csproj]        
    C:\Program Files\dotnet\sdk\6.0.101\Microsoft.Common.CurrentVersion.targets(2304,5): warning MSB3246:    at Microsoft.Build.Tasks.ReferenceTable.SetPrimaryAssemblyReferenceItem(ITaskItem referenceAssemblyName) [C:\Users\ganzo\Documents\Development\TestPrinterPnP-net47\TestPrinterPnP-net47.csproj]
