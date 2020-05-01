$ErrorActionPreference = 'SilentlyContinue'

cd "$($env:LOCALAPPDATA)\Android\Sdk\emulator" 

$lista = @(./emulator.exe -list-avds)

$options = [System.Management.Automation.Host.ChoiceDescription[]]($lista)

$title = 'Executar emulador'
$message = if($lista.Count -gt 1) {'Emuladores disponíveis'} else {'Emulador disponível'}

$result = $host.ui.PromptForChoice($title, $message, $options, 0)

./emulator.exe -avd $lista[$result]