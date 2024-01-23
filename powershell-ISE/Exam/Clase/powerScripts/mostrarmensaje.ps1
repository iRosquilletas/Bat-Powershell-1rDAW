do{
    $sms= Read-Host Dime un mensaje
    [int]$veces= Read-Host ¿Cuantas veces lo quieres repetir?

    $repe=Read-Host ¿Estas seguro que quieres mostrar este mensaje $sms  $veces veces?

    if($repe -eq "si"){
        Write-Host sigamos adelante
        break
    }elseif($repe -eq "no"){
        Write-Host volvamos a empezar
    }else{
        Write-host Note entiendo volvamos a empezar
    }
}while($true)



for($i=$veces; $i -ge 1; $i--){
    
    write-host $i $sms
}

