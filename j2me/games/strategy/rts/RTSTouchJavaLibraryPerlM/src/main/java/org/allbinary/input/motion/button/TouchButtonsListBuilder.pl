# 
# AllBinary Open License Version 1 
# Copyright (c) 2007 AllBinary 
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

package org::allbinary::input::motion::button::TouchButtonsListBuilder;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::button::BaseTouchInput';


sub _init_fields {
    my ($self) = @_;
    $self->{baseTouchInputList} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub addList {
    my ($self, $list) = @_;
        my $size = $self->{baseTouchInputList}->size();
        my $baseTouchInput = undef;
        for (my $index = 0; $index < $size; $index++) {
            $baseTouchInput = $self->{baseTouchInputList}->get($index);
            $list->addAllList($baseTouchInput->getList());
        }
}


sub add {
    my ($self, $baseTouchInput) = @_;
        $self->{baseTouchInputList}->add($baseTouchInput);
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::motion::button::BaseTouchInput;

1;

