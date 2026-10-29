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

package org::allbinary::game::input::J2MEGameInputMapping;
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
        'org::allbinary::game::input::J2MEKeyFactory'->getInstance()->init();
        $self->SUPER::init($abeClientInformation);
        if ($self->getTotalMapped() == 0 || $self->isDefaultNew()) {
            $self->getInputMapping()->addMapping($self->getDefault());
            $self->save($abeClientInformation);
        }
}


sub isDelete {
    my ($self, $input) = @_;
        if ($input == 'org::allbinary::game::input::GameKeyFactory'->getInstance()->{GAME_D}) {
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
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::game::input::J2MEKeyFactory;
use org::allbinary::game::input::GameKeyFactory;

1;

