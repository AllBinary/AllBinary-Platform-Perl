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

package org::allbinary::game::input::PCGameInputMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::mapping::PersistentInputMapping';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::configuration::persistance::GamePersistanceStrings'->getInstance()->{SAVED_INPUT_CONFIGURATION_RECORD_ID});
        # super(...) made $self above
    return $self;
}


# throws Exception
sub init {
    my ($self, $abeClientInformation) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{INIT});
        'org::allbinary::game::input::PCKeyFactory'->getInstance();
        'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance();
        'org::allbinary::input::motion::gesture::TrackballMotionGestureFactory'->getInstance();
        'org::allbinary::input::motion::button::BasicTouchInputFactory'->getInstance();
        $self->SUPER::init($abeClientInformation);
        if ($self->getTotalMapped() == 0 || $self->isDefaultNew()) {
            $self->getInputMapping()->addMapping($self->getDefault());
            $self->save($abeClientInformation);
        }
}


sub isDelete {
    my ($self, $input) = @_;
        if ($input == 'org::allbinary::game::input::PCKeyFactory'->getInstance()->{DEL}) {
            return 1;
        } else {
            return 0;
        }
}


sub isSystemInput {
    my ($self, $input) = @_;
        return 0;
}

use org::allbinary::game::configuration::persistance::GamePersistanceStrings;
use org::allbinary::game::input::mapping::PersistentInputMapping;
use org::allbinary::input::motion::button::BasicTouchInputFactory;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::input::motion::gesture::TrackballMotionGestureFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::game::input::PCKeyFactory;

1;

