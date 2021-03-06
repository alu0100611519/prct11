require "./lib/matrix_expansion/matrix.rb"
require "./lib/matrix_expansion/matrix_densa.rb"
module MatrixExpansion
class MatrizDispersa<Matriz
   
 attr_accessor :dfil, :dcol, :dvalor, :elementos
    def initialize(n,m)
	super
	@dcol=Array.new()
	@dfil=Array.new()
	@dvalor=Array.new()
	@elementos=0
      end
###################################### CONVERSION A DISPERSA #################################     
      
    def cv
      	 
        r=0
	h=0
	while h<@fil
	  g=0
	    while g<@col
		if (@valor[h][g]!=0)
		    @elementos=@elementos+1
		    @dcol[r]=g
		    @dfil[r]=h
		    @dvalor[r]=@valor[h][g]

		    r=r+1
		end
		g=g+1
	    end
	    h=h+1
	 end
	 if ((@fil*@col*0.6) < @elementos)
	   puts "ERROR tiene que ser matriz dispersa"
	   @dcol=nil
	   @dfil=nil
	   @dvalor=nil
	   
	 end

    end
  ##################################### METODO TO_S ##############################     
      
      def to_s
	k=0
	aux=0
	  cadena= ""
	    while k<@fil
	      j=0
		  while j<@col
		      if j==@dcol[aux] && k==@dfil[aux]
			    cadena+="#{@dvalor[aux]} "	 
			    if ((aux+1)<@elementos)
			      aux=aux+1
			    end
		      else
			    cadena+="0 "
		      end
		   j=j+1		      
		  end
		  cadena+="\n"
		k=k+1
	    end
	puts cadena
      end  

      
      
#################################### METODO GET #######################################

    def get(z,x)
      k=0
	aux=0
	    while k<@fil
	      j=0
		  while j<@col
		    if aux<@elementos
		      if x==@dcol[aux] && z==@dfil[aux]
			return @dvalor[aux]	
		      end
		    else
		      return 0
		    end		
		    aux=aux+1
		   j=j+1		      
		  end
		k=k+1
	    end 
     
    end
      
#################################### METODO SUMA DISPERSA #############################
    
  def +(other)
    x=Matriz.new(@fil,@col)
    i=0
    self.fil.times do |i|
      j=0
	self.col.times do |j|
	  x.valor[i][j]=self.get(i,j)+other.get(i,j)

	  j=j+1
	end
	i=i+1
    end
    x
   end
  
#################################### METODO RESTA DISPERSA ############################
    def -(other)
    x=Matriz.new(@fil,@col)
    i=0
    self.fil.times do |i|
      j=0
	self.col.times do |j|
	  x.valor[i][j]=self.get(i,j)-other.get(i,j)

	  j=j+1
	end
	i=i+1
    end
    x
   end

#################################### METODO MULTIPLICAR ###############################
   
  def  *(other)
    x=Matriz.new(@col,@fil)
      i=0
      while i < @fil
	j = 0
	while j < other.col
	  k = 0
	  while k < @col
	    x.valor[i][j] = x.valor[i][j]+ (self.get(i,k)*other.get(k,j))
	    k=k+1
	  end
	  j=j+1
	end
	i=i+1
      end
      x
  end
  
#################################### METODO MAXIMO ####################################
  def max
    i=0
    aux= @dvalor[0]
    
    self.elementos.times do |i|
       if aux < @dvalor[i]
	 aux = @dvalor[i]
       end
      i= i +1
    end  
    aux
  end
#################################### METODO MINIMO ####################################
    def min
    i=0
    aux= @dvalor[0]
    
    self.elementos.times do |i|
       if aux > @dvalor[i]
	 aux = @dvalor[i]
       end
      i= i +1
    end
    aux
  end
#################################### METODO [] ########################################
      
    def [](i)
      @valor[i]
    end
    
    ######################## METODO []= ###########################################    
    
    def []=(i,other)
      @valor[i]= other
    end

    
  end
end



