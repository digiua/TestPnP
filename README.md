# TestPrinterPnP

Ejemplo de codigo para generar factura fiscal en equipos PnP en C# y otros lenguajes
Para información adicional: https://desarrollospnp.com/pregunta

O siguenos en nuestra cuenta de twitter @desarrollospnp

Contactanos via Whatsapp: https://wa.me/582122859960

Si compilas en 32 bits, utiliza el pnpdll.dll

Se anexan ejemplos en otras plataformas, como guia de integracion

Segun nos reportan integradores para VB.net, además de importar tipo Ansi cualquier compilación con el Framework mayor a 4.0 tiene problemas de compatibilidad con pnpdll.dll
Segun investigamos parece que el cambio de CLR 2 a CL4 está afectando la forma de llamar a funciones Ansi stdcall win32.
