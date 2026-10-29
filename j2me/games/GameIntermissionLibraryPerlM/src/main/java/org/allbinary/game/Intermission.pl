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

package org::allbinary::game::Intermission;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::IntermissionInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{enabled} = 0;
    $self->{timeElapsedHelper} = 'org::allbinary::time::TimeDelayHelper'->new(0);
    $self->{intermissionEnableListener} = 'org::allbinary::game::NullIntermissionEnableListener'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub setListener {
    my ($self, $enableListener) = @_;
        $self->{intermissionEnableListener} = $enableListener;
}


sub getTimeDelayHelper {
    my ($self) = @_;
        return $self->{timeElapsedHelper};
}


sub setEnabled {
    my ($self, $enabled) = @_;
        $self->{enabled} = $enabled;
        if ($self->isEnabled()) {
            $self->getTimeDelayHelper()->setStartTimeTNT();
        }
        $self->{intermissionEnableListener}->notifyIntermission($enabled);
}


sub isEnabled {
    my ($self) = @_;
        return $self->{enabled};
}

use org::allbinary::time::TimeDelayHelper;
use org::allbinary::game::IntermissionInterface;
use org::allbinary::game::NullIntermissionEnableListener;

1;

