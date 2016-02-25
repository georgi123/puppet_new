class usergroup {
###GROUP CREATION STARTS HERE ==>
  group { "plamen.ivanov":
      ensure => present,
      gid => 1500,
  }
  
  group { "test":
  	ensure => 'present',
	gid => 30116,
  }
 
  group { "data.enrichment":
	ensure => 'present',
	gid => 30117,
  }
  group { "Analysts":
	ensure => 'present',
	gid => 30118,
  }
  group { "Administrators":
	ensure => 'present',
	gid => 30119,
  }
  group { "default":
	ensure => 'present',
	gid => 30120,
  }
  group { "USMAM":
        ensure => 'present',
        gid => 30121,
  }

###GROUP CREATION ENDS HERE <==
user { 'permissions.test':
  ensure     => present,
  home       => '/home/permissions.test',
  shell      => '/bin/bash',
  managehome => true,
}

user { 'joachim.dort':
         ensure => present,
         home  => '/home/joachim.dort',
         shell => '/bin/bash',
         password => '123456',
         managehome => true,
  }

file { '/home/joachim.dort':
    ensure => 'directory',
    owner  => 'joachim.dort',
    group  => 'joachim.dort',
  }
file { '/home/joachim.dort/.ssh':
     ensure => 'directory',
     owner  => 'joachim.dort',
     group  => 'joachim.dort',
   }
##
user { 'pk.test':
          ensure => present,
          home  => '/home/pk.test',
          shell => '/bin/bash',
          password => '123456',
          managehome => true,
   }

 file { '/home/pk.test':
     ensure => 'directory',
     owner  => 'pk.test',
     group  => 'pk.test',
   }
 file { '/home/pk.test/.ssh':
      ensure => 'directory',
      owner  => 'pk.test',
      group  => 'pk.test',
   }

 user { 'plamen.ivanov':
 	ensure => present,
#	home  => '/home/plamen.ivanov',
	shell => '/bin/bash',
    groups     => ["Administrators", "Analysts", "data.enrichment",'hadoop'],
	password => '123456',
	managehome => true,
 }
 user { 'test':
	ensure => present,
	groups => ["test", "data.enrichment",'hadoop'],
	shell => '/bin/false',
 }
### HUE USERS START HERE ### 
user { 'Michael':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 
 }
user { 'ewa':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Sina.Vukcevic':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'iva':
	ensure => present,
	groups => ["Administrators", "Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/false',
 }
user { 'spas':
	ensure => present,
	groups => ["default", "Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'christian.langer':
	ensure => present,
	groups => ["Administrators", "Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Nadine.Dannenbauer':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'atr2gxl':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Rustem':
	ensure => present,
	groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/false',
 }
user { 'teodora.kavroshilova':
	ensure => present,
	groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/bash',
 }
user { 'simona.simeonova':
	ensure => present,
	groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/bash',
 }
user { 'yana.bogdanova':
	ensure => present,
	groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/false',
 }
user { 'admin':
	ensure => present,
	groups => ["default", "Administrators",'hadoop'],
	shell => '/bin/false',
 }
user { 'daniel.belz':
	ensure => present,
	groups => ["default",'hadoop'],
	shell => '/bin/false',
 }
user { 'ctillmanns':
	ensure => present,
	groups => ["Administrators", "Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'joro':
	ensure => present,
	groups => ["default", "Administrators",'hadoop'],
	shell => '/bin/false',
 }
user { 'monia':
	ensure => present,
	groups => ["default",'hadoop'],
	shell => '/bin/false',
 }
user { 'Viktoria':
	ensure => present,
	groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/false',
 }
user { 'Karlheinz':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'joerg.petzold':
	ensure => present,
	groups => ["default",'hadoop'],
	shell => '/bin/false',
 }
user { 'plamen.kolev':
	ensure => present,
	groups => ["default", "Administrators",'hadoop'],
	shell => '/bin/false',
 }
user { 'andreas.bisping@gfk.com':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'vivianmelissa.glinski':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'andreas.bisping':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'jonathan.eschbach':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'anton.heigl':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'plamen.yotov':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'christoph.schoell':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'hannesCarl.meyer':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'philip.meier':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'piotrKurowski':
	ensure => present,
	groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/false',
 }
user { 'Jim.Collins':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'mike.conklin':
	ensure => present,
	groups => ["Analysts", "USMAM",'hadoop'],
	shell => '/bin/false',
 }
user { 'Vlad.Ardelean':
	ensure => present,
	groups => ["default",'hadoop'],
	shell => '/bin/false',
 }
user { 'Anita.Adameczek':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Marek.Blazewicz':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Michal.Domaradzki':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Krzysztof.Domeradzki':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Agnieszka.Fronczyk':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Pawel.Goralczyk':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Monika.Guminska':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Anna.Krempa-Kowalewska':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Malgorzata.Lubieniecka':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Jerzy.Madej':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Bartosz.Osinski':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Lukasz.Ostrowski':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Emilia.Pompe':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Adam.Radwanski':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Andrzej.Surma':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Marek.Szczotkowski':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Janusz.Wierzejski':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Piotr.Zielonka':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Gencay.Turan':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Mert.Barut':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'James.Gagen':
	ensure => present,
	groups => ["USMAM",'hadoop'],
	shell => '/bin/false',
 }
user { 'nathaniel.zaidel':
	ensure => present,
	groups => ["USMAM",'hadoop'],
	shell => '/bin/false',
 }
user { 'Gerard.Broussard':
	ensure => present,
	groups => ["USMAM",'hadoop'],
	shell => '/bin/false',
 }
user { 'Diana.Lukova':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/bash',
 }
user { 'tsvetelina.genovska':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/bash',
 }
user { 'radoslava.lipanova':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/bash',
 }
user { 'Dariusz.Pukas':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'almudena.alvarez':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'jeroen.nikkel':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Carolien.Govers@gfk.com':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Sandra.van.Dijke@gfk.com':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Peter.van.Eck@gfk.com':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Angelique.Wijnings@gfk.com':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Jon.Zwijnenburg@gfk.com':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Pieter.Cappon@gfk.com':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'aleksandar.tomov':
	ensure => present,
	groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/bash',
 }
user { 'tsvetalin.tsonev':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/bash',
 }
user { 'kristina.arsova':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Markus.Lilienthal':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Philipp.Bleninger':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Stefan.Wehner':
	ensure => present,
	groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/false',
 }
user { 'Eduardo.Thompson':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Rafael.Farias':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Flavia.Bianchi':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Felipe.Roth':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 }
user { 'Kay.Fleischmann':
        ensure => present,
        groups => ["Analysts",'hadoop'],
        shell => '/bin/false',
 }
user { 'nina.poehlmann':
        ensure => present,
        groups => ["data.enrichment",'hadoop'],
        shell => '/bin/false',
 }
user { 'Peter.van.Eck':
        ensure => present,
        groups => ["Analysts", "data.enrichment",'hadoop'],
        shell => '/bin/false',
 }
user { 'Silva.Maikon':
         ensure => present,
         groups => ["Analysts", "data.enrichment",'hadoop'],
         shell => '/bin/false',
 }

user { 'Andreas.Thaller':
        ensure => present,
        groups => ["Analysts", "data.enrichment",'hadoop'],
	shell => '/bin/false',
}
user { 'Jessica.Klos':
	ensure => present,
	groups => ["data.enrichment",'hadoop'],
	shell => '/bin/false',
}
user { 'Laura.Hoyden':
	ensure => present,
	groups => ["data.enrichment",'hadoop'],
	shell => '/bin/false',
}
user { 'sandra.romeis':
	ensure => present,
	groups => ["data.enrichment",'hadoop'],
	shell => '/bin/false',
}
user { 'oliver.huelser':
	ensure => present,
	groups => ["data.enrichment",'hadoop'],
	shell => '/bin/false',
}
user { 'florian.brodersen':
        ensure => present,
        groups => ["data.enrichment"],
        shell => '/bin/false',
}

# Regular user also using Hue
  group { 'thomas.memenga':
    ensure => present,
    gid    => 1501,
  }
  
  user { 'thomas.memenga':
    ensure     => present,
    uid        => 1501,
    gid        => 'thomas.memenga',
    groups     => ["Administrators", "Analysts", "data.enrichment",'hadoop'],
    shell      => '/bin/bash',
    managehome => true,
  }

  ssh_authorized_key { 'thomas.memenga':
    ensure => present,
    key    => 'AAAAB3NzaC1kc3MAAAEBAJutFClcAY7qoUi2zOnayJ9yHXZCGqulLK1ZdAf3F38UkQetI4fOA2v4YkrKSozohg8Nl5LhmOfOMnaTbxjPhAFvp0C7sOnydj5cRTzPYk94uBrRUXcpaTZ4kCz/p5lT/66ud2DQZMr4Lhh2n0C4u54B48CODRXzbAHFnkoZzdS92Q1I6vkQ/k9OOWPSKLvjfrx001WA1Frge8pjiIOhR4x37JE7sL1jGZRM1EIXSYRwl8B5MviDMrZIBtfbrkaZa92LAM/5sKtsG53QGmfOf2hMT6QWJ5W2ogsQBuhvfS6VHmAOdsKen87gOrMPjQpXhOAd4W07aYlvxE7yr1Mvh4UAAAAVAMk3cUV84saO4p+XMdA+tXYQpJXZAAABAGswPHddFEJJyoRddPN7S4a+8Z3+TT5Y8w/B9y0rUoIOhO8xSGbUzS6xBO78MU4a2t0plhx7mOYn4/bV4EVznD+421r1JtnMDCrAtp0oihtE1nDKw/XB8fOaBGyf6ITF3HQHWdK74vnL06C4tpwplH1WdROfN4ZBUJvKwePSo2GUcG1xmIHIjET3YSNutDfkdqbcH5obs6mVlwSwwMggsr7pfl3J9tgjmEop1A7B/Fcf8MCUymEvmLRejKe78CdzQjMt2XDl9M3+11a7+0fcN5C140Vkv+cVKjLr40TCtJbWqpd+Ho6ZkxyH178ZOX3EPGeJVxmahTU+wwj9yA3LVu8AAAEBAICicP5BWPAk+ihXpc5swvp8sqZujCJPcwnucM0qidNDwd5CcBxdqjhYC58J1iNJnFnSlEJ2UPSk0AzPWgKFwTs2EiDaTSJLxP/iQF1B7vruwUYzNwVB49Z2NbbRDBj/91E+mnJlj8sK2mkF7pQnl5hyffy2hme8OwWwVrKihzHcAXCUMH6qhAx8VozDrJYlckNBUhwXKkmmtiIG2qX4DJc3DZb2kxLPFXLG0XfWDEJrUHoZsFORRJubUYAHELjm5E4pDgCsIh6lcIizPjyioZEit2TIdSV0h7U+aa2zsBReXTC+Tn4qHpAxfGa6AeCjuDBFRXCrIQwYaeA6evFp33U=',
    type   => 'ssh-dss',
    user   => 'thomas.memenga',
  }

#  sudo::conf { 'thomas.memenga':
#    priority => 10,
#    content  => 'thomas.memenga ALL=(hdfs) NOPASSWD: ALL',
#  }

  file { '/etc/sudoers.d/10_thomas-memenga':
    ensure  => present,
    content => "thomas.memenga ALL=(hdfs) NOPASSWD: ALL\n",
    mode    => '0440',
    require => User['thomas.memenga'],
  }

  user { 'uld':
    ensure     => absent,
    groups     => ["Administrators", "Analysts", "data.enrichment",'hadoop'],
    managehome => true,
  }

  user { 'Andrian.Ivanov':
    ensure => present,
    groups => ["Analysts",'hadoop'],
    shell  => '/bin/false',
  }
 user { 'Manuel.Messner':
     ensure => present,
     groups => ["Administrators", "Analysts", "data.enrichment",'hadoop'],
     shell  => '/bin/false',
   }
  user { 'Diana.Minciuna':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 } 
 user { 'Stefana.Frunceac':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 } 
 user { 'Alina.Ionita':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 } 
 user { 'Alexandra.Parvu':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 } 
 user { 'Mimi.Chong':
	ensure => present,
	groups => ["Analysts",'hadoop'],
	shell => '/bin/false',
 } 
}

