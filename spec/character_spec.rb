require 'spec_helper'
require 'character'

describe Character do
  context '#greeting' do
    it 'works for ogre warrior' do
      ogre = Character.new(:race=>'ogre', :occupation=>'warrior')
      ogre.greeting.should == 'Grumph! I will kill you!'
    end

    it 'works for elven wizard' do
      elf = Character.new(:race=>'elf', :occupation=>'wizard')
      elf.greeting.should == 'Heil! Did you see my staff?'
    end

    it 'works for hobbit thief' do
      hobbit = Character.new(:race=>'hobbit', :occupation=>'thief')
      hobbit.greeting.should == "Good Morning. Haven't you lost something?"
    end

    it 'works for gnome programmer' do
      gnome = Character.new(:race=>'gnome', :occupation=>'programmer')
      gnome.greeting.should == 'GutenTag. DoYouKnowRuby?'
    end

    it 'works for dwarf smith' do
      dwarf = Character.new(:race=>'dwarf', :occupation=>'smith')
      dwarf.greeting.should == 'Humpf! Your sword needs to be fixed.'
    end

    it 'works for human priest' do
      human = Character.new(:race=>'human', :occupation=>'priest')
      human.greeting.should == 'Good Day. Only Chosen One knows his path!'
    end

    it 'works for human programmer' do
      gnome = Character.new(:race=>'human', :occupation=>'programmer')
      gnome.greeting.should == 'Good Day. Do you know Ruby?'
    end
  end
end