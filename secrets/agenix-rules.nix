let
  francesca = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICVqBaFe+y8x3MzR+hSQETMbCQvtBI4Ywj7zAy2AM9yL root@francesca";
  
  systems = [ francesca ];

in
{
  "timezone.age".publicKeys = systems;
}
