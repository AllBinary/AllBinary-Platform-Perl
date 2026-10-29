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

package org::allbinary::game::configuration::event::GameInitializedEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{resourceLoadingLevel} = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance()->{LEVEL};
    $self->{level} = 0;
}


sub new {
    my ($class, $anyType) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub setLevel {
    my ($self, $level) = @_;
        $self->{level} = $level;
        $self->{resourceLoadingLevel} = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance()->{LEVEL};
}


sub getLevel {
    my ($self) = @_;
        return $self->{level};
}


sub setResourceLoadingLevel {
    my ($self, $resourceLoadingLevel) = @_;
        $self->{resourceLoadingLevel} = $resourceLoadingLevel;
        $self->{level} = $self->{resourceLoadingLevel}->getLevel();
}


sub getResourceLoadingLevel {
    my ($self) = @_;
        return $self->{resourceLoadingLevel};
}

use org::allbinary::game::resource::ResourceLoadingLevel;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

