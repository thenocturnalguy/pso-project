function [bestCost]=spso(costFunction,parameters)

	nVar=parameters.nVar;
	varSize=[1 nVar];
	varMin=parameters.varMin;
	varMax=parameters.varMax;
	maxVel=0.1*(varMax-varMin);
	minVel=-maxVel;

	% PSO paremeters 

	MaxIter=parameters.MaxIter;
	nPop=parameters.nPop;
	w=1;
	wDamp=0.99;
	c1=2;
	c2=2;
	eachParticle.Position=[];
	eachParticle.Velocity=[];
	eachParticle.Cost=[];
	eachParticle.Best.Position=[];
	eachParticle.Best.Cost=[];
	particles=repmat(eachParticle,nPop,1);
	globalBest.Cost=inf;

	% Create population array

	for i=1:nPop

		% Generate random solution

		particles(i).Position=unifrnd(varMin,varMax,varSize);

		% Evaluation

		particles(i).Cost=costFunction(particles(i).Position);
		particles(i).Velocity=zeros(varSize);
		particles(i).Best.Position=particles(i).Position;
		particles(i).Best.Cost=particles(i).Cost;
		if particles(i).Best.Cost < globalBest.Cost
			globalBest=particles(i).Best;
		end
	end

	% Array to hold the best cost value after each iteration

	bestCost=zeros(MaxIter,1);

	% Main loop of PSO

	for it=1:MaxIter
		for i=1:nPop

			% Updating the velocity

			particles(i).Velocity=(w*particles(i).Velocity)+(c1*rand(varSize).*(particles(i).Best.Position-particles(i).Position))+(c2*rand(varSize).*(globalBest.Position-particles(i).Position));
			particles(i).Velocity=max(particles(i).Velocity,minVel);
			particles(i).Velocity=min(particles(i).Velocity,maxVel);

			% Updating the position

			particles(i).Position=particles(i).Position+particles(i).Velocity;
			particles(i).Position=max(particles(i).Position,varMin);
			particles(i).Position=min(particles(i).Position,varMax);
			
			% Updating the cost of each particle

			particles(i).Cost=costFunction(particles(i).Position);
			
			% Updating the particles best position and cost

			if particles(i).Cost < particles(i).Best.Cost
				particles(i).Best.Position=particles(i).Position;
				particles(i).Best.Cost=particles(i).Cost;

				% Updating the global best

				if particles(i).Best.Cost < globalBest.Cost
					globalBest=particles(i).Best;
				end
			end
		end
	
		% Updating the best cost

		bestCost(it)=globalBest.Cost;

		% Damping the inertia coeficient

		w=w*wDamp;
	end
end
