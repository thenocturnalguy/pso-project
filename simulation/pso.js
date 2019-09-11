
////////////////////////////////////////////////////
//                                                //
//       ***PARTICLE SWARM OPTIMIZATION***        //
//                Code Written By                 //
//                  Rahul Gupta                   //
//                                                //
////////////////////////////////////////////////////

//----------------- Variable Declaration --------------------------

const swarmArea=document.getElementById('swarmarea');
swarmArea.width=window.innerWidth*.6;
swarmArea.height=window.innerHeight*.8;
var ctx=swarmArea.getContext('2d');

var c1;								// coefficient of cognitive component
var c2;								// coefficient of global component
var w;								// inertia weight
var swarmSize;						// total number of particles
var gBest={							// particle's personal best or cognitive component
	x:undefined,
	y:undefined
}
var iteration;
var maxIteration;
var totalIteration;
var continueIter;
var particles=[];					// particle array

//------------------ Initialize PSO Parameters --------------------

var initMethod=() => {
	ctx.clearRect(0,0,swarmArea.width,swarmArea.height);
	var i,particle;
	var pBest,velocity;
	this.c1=2;
	this.c2=2;
	this.w=0.9;
	this.swarmSize=100;
	this.totalIteration=0;
	this.gBest.x=Infinity;
	this.gBest.y=Infinity;
	this.particles.length=0;
	for(i=0;i<this.swarmSize;i++)
	{
		particle={};
		particle.x=15+Math.random()*(swarmArea.width-15);
		particle.y=15+Math.random()*(swarmArea.height-15);
		velocity={};
		velocity.x=0;
		velocity.y=0;
		particle.velocity=velocity;
		pBest={};
		pBest.x=particle.x;
		pBest.y=particle.y;
		particle.pBest=pBest;
		drawParticle(particle.x,particle.y);
		if(objectiveFunction(particle.pBest.x)<=objectiveFunction(this.gBest.x))
			this.gBest.x=particle.pBest.x;
		if(objectiveFunction(particle.pBest.y)<=objectiveFunction(this.gBest.y))
			this.gBest.y=particle.pBest.y;
		this.particles.push(particle);
	}
}

//------------------ PSO Algorithm ------------------------------

var psoMethod=() => {
	var i,j,particle;
	this.iteration=0;
	if(this.swarmSize==undefined)
	{
		alert('The Search Space is Empty');
		return;
	}
	this.maxIteration=160;
	this.continueIter=true;
	var startPSO=setInterval(() => {
		if(this.continueIter==false)
			clearInterval(startPSO);
		ctx.fillStyle='rgba(0,0,0,0.45)';
		ctx.fillRect(0,0,swarmArea.width,swarmArea.height);
		this.iteration++;
		this.totalIteration++;
		for(i=0;i<this.particles.length;i++)
		{
			particle=this.particles[i];
			particle.velocity.x=(w*particle.velocity.x)+(this.c1*Math.random()*(particle.pBest.x-particle.x))+(this.c2*Math.random()*(this.gBest.x-particle.x));		// updating the particle x velocity
			particle.velocity.y=(w*particle.velocity.y)+(c1*Math.random()*(particle.pBest.y-particle.y))+(c2*Math.random()*(this.gBest.y-particle.y));					 // updating the particle y velocity
			particle.x=particle.x+particle.velocity.x;			// updating the particle x position
			particle.y=particle.y+particle.velocity.y;			// updating the particle y position
			if(objectiveFunction(particle.x)<=objectiveFunction(particle.pBest.x))
			{
				particle.pBest.x=particle.x;					// updating the personal best x of the particle
				if(objectiveFunction(particle.pBest.x)<=objectiveFunction(this.gBest.x))
					this.gBest.x=particle.pBest.x;				// updating the gloabl best x of the particle
			}
			if(objectiveFunction(particle.y)<=objectiveFunction(particle.pBest.y))
			{
				particle.pBest.y=particle.y;					// updating the personal best y of the particle
				if(objectiveFunction(particle.pBest.y)<=objectiveFunction(this.gBest.y))
					this.gBest.y=particle.pBest.y;				// updating the personal best y of the particle
			}
			
			drawParticle(particle.x+swarmArea.width/2,particle.y+swarmArea.height/2);			// drawing the scaled 																							particle
			this.particles[i]=particle;
		}
		this.w*=0.99;					// Decrementing the inertia weight with each iteration
	
		//------------------ Stopping condition -----------------------------

		this.continueIter=false;
		if(this.iteration!=this.maxIteration)
			this.continueIter=true;
	},80);
}

//---------------------- Objective Function ---------------------------------

var objectiveFunction=(val) => {
	fx=(val-20)**2+(val**2-25)**2;				// Objective Function 1
	//fx=val**2;								// Objective Function 2
	return fx;
}

//---------------------- Drawing Particle ---------------------------------

var drawParticle=(x,y) => {
	ctx.beginPath();
	ctx.fillStyle='#ffc300';
	ctx.arc(x,y,5,0,2*Math.PI,false);
	ctx.fill();
}
