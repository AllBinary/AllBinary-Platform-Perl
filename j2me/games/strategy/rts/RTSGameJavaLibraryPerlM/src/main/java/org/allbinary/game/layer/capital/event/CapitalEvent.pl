# 
# AllBinary Open License Version 1 
# Copyright (c) 2002 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot  
# Generated Code Do Not Modify

package org::allbinary::game::layer::capital::event::CapitalEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{value} = 0;
}


sub new {
    my ($class, $anyType) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("CapitalEvent: Value: \n");
        $stringBuffer->appendint($self->getValue());
        return $stringBuffer->toString();
}


sub getValue {
    my ($self) = @_;
        return $self->{value};
}


sub setValue {
    my ($self, $value) = @_;
        $self->{value} = $value;
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::event::AllBinaryEventObject;

1;

