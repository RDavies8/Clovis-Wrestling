class AddWrestlersData < ActiveRecord::Migration
  def change
  	jmejia = Wrestler.new(:name => "Justin Mejia", :user_id => "jmejia", :year => "Freshman", :state => "1st", :masters => "1st");
  	jmejia.save(:validate => false);

  	tgilliland = Wrestler.new(:name => "Tristan Gillialand", :user_id => "tgilliland", :year => "Junior", :state => "7th", :masters => "7th");
  	tgilliland.save(:validate => false);

  	bmartino = Wrestler.new(:name => "Brandon Martino", :user_id => "bmartino", :year => "Freshman", :state => "N/A", :masters => "N/A");
  	bmartino.save(:validate => false);

  	dmartinez = Wrestler.new(:name => "Dylan Martinez", :user_id => "dmartinez", :year => "Sophomore", :state => "7th", :masters => "7th");
  	dmartinez.save(:validate => false);

  	dmartinez = Wrestler.new(:name => "Dylan Martinez", :user_id => "dmartinez", :year => "Sophomore", :state => "7th", :masters => "7th");
  	dmartinez.save(:validate => false);

    kolivas = Wrestler.new(:name => "Khristian Olivas", :user_id => "kolivas", :year => "Junior", :state => "4th", :masters => "DNP (4th in 2013)");
    kolivas.save(:validate => false);

    ihokit = Wrestler.new(:name => "Isaiah Hokit", :user_id => "ihokit", :year => "Junior", :state => "5th", :masters => "3rd");
    ihokit.save(:validate => false);
  end
end
