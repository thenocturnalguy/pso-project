function [bestCost]=cpbgcpso(costFunction,parameters)

	nVar=parameters.nVar;
	varSize=[1 nVar];
	varMin=parameters.varMin;
	varMax=parameters.varMax;
	maxVel=0.1*(varMax-varMin);
	minVel=-maxVel;

	% PSO paremeters 
	
	kappa=1;
	phi1=2.05;
	phi2=2.05;
	phi=phi1+phi2;
	chi=2*kappa/abs(2-phi-sqrt(phi^2-4*phi));
	w=chi;
	c1=chi*phi1;
	c2=chi*phi2;
	% wDamp=0.975;
	MaxIter=parameters.MaxIter;
	nPop=parameters.nPop;
	eachParticle.Position=[];
	eachParticle.Velocity=[];
	eachParticle.Cost=[];
	eachParticle.Best.Position=[];
	eachParticle.Best.Cost=[];
	particles=repmat(eachParticle,nPop,1);
	globalBest.Cost=inf;
	rho=1;
	consecSuccess=15;
	consecFailure=5;
	success=0;
	failure=0;

	% Create population array

	globalBestParticle.Position=randi(varSize,varSize);
	globalBestParticle.Velocity=zeros(varSize);
	globalBestParticle.Cost=inf*ones(varSize);

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
			r1=rand(varSize);
			r2=rand(varSize);

			% Updating the velocity
			
			particles(i).Velocity=w*(particles(i).Velocity+c1*r1.*(particles(i).Best.Position-particles(i).Position)+c2*r2.*(-particles(i).Position));
			particles(i).Velocity=max(particles(i).Velocity,minVel);
			particles(i).Velocity=min(particles(i).Velocity,maxVel);

			% Updating the position

			particles(i).Position=particles(i).Position+particles(i).Velocity;
			particles(i).Position=max(particles(i).Position,varMin);
			particles(i).Position=min(particles(i).Position,varMax);

			% Updating the cost of each particle

			particles(i).Cost=costFunction(particles(i).Position);
							
			% Updating the particles best position and cost

			if particles(i).Cost < particles(i).Best.Cost && particles(i).Cost>=0
				particlesVelocity=particles(i).Velocity;
				particlesVelocity=-particles(i).Position+particles(i).Best.Position+w*particlesVelocity+rho*(1-2*r1);
				particlesPosition=particles(i).Best.Position+w*particlesVelocity+rho*(1-2*r1);
				particlesBestCost=costFunction(particlesPosition);
				if particlesBestCost<particles(i).Best.Cost && particlesBestCost>=0
					particles(i).Best.Cost=particlesBestCost;
					particles(i).Best.Position=particlesPosition;
					particles(i).Velocity=particlesVelocity;
				else
					particles(i).Best.Cost=particles(i).Cost;
					particles(i).Best.Position=particles(i).Position;
				end
					
				% Updating the global best

				if particles(i).Best.Cost < globalBest.Cost
					globalBest=particles(i).Best;
					success=success+1;
					failure=0;
					if(success>consecSuccess)
						success=0;
						rho=2*rho;
					end
				elseif particles(i).Best.Cost > globalBest.Cost
					failure=failure+1;
					success=0;
					if failure>consecFailure
						failure=0;
						rho=0.5*rho;
					end
				end
			end
		end

		% w=w*wDamp;

		bestCost(it)=globalBest.Cost;
	end
end
