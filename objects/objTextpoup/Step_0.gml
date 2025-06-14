// Movimenta o texto para cima
y += y_speed;
// Diminui a transparência gradualmente
alpha -= 0.01;
// Destrói após 'life' frames
if(life-- <=0)
{
	instance_destroy();
}