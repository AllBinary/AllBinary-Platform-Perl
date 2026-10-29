#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::game::init::CommonGameInitialization;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::init::BaseGameInitialization';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class, $resourceInitializationArray, $portion) = @_;
    my $self = $class->SUPER::new($resourceInitializationArray, $portion);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub init {
    my ($self, $abeClientInformation, $commandListener, $level) = @_;
        $self->SUPER::init($abeClientInformation, $commandListener, $level);
        my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
        if (!$self->isGameInitialized() && $level == $resourceLoadingLevelFactory->{LOAD_ALL}->getLevel()) {
            $self->setGameInitialized(1);
            my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
            'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->init();
            $progressCanvas->addNormalPortion(50, "Integers");
            'org::allbinary::graphics::PointFactory'->getInstance()->init();
            $progressCanvas->addNormalPortion(50, "Points");
            'org::allbinary::math::AngleFactory'->getInstance();
            $progressCanvas->addNormalPortion(50, "Angles");
            $self->initGame();
            $self->{resourceInitializationArray}->[$self->{GAME_RESOURCES}]->init();
        }
        $self->SUPER::resourceInitialization($level);
}


# throws Exception
sub initGame {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}

# use javax::microedition::lcdui::CommandListener;
use org::allbinary::game::resource::ResourceInitialization;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::math::AngleFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::game::init::BaseGameInitialization;

1;

