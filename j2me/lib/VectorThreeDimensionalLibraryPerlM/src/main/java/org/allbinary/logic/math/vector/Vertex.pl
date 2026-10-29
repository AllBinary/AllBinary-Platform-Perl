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

package org::allbinary::logic::math::vector::Vertex;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{x} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
    $self->{y} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
    $self->{z} = 'org::allbinary::logic::math::BasicDecimal'->new(0);
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $positionStrings = 'org::allbinary::math::PositionStrings'->getInstance();
        $stringBuffer->append($positionStrings->{X_LABEL});
        $stringBuffer->append($self->{x}->toString());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($positionStrings->{Y_LABEL});
        $stringBuffer->append($self->{y}->toString());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($positionStrings->{Z_LABEL});
        $stringBuffer->append($self->{z}->toString());
        return $stringBuffer->toString();
}

use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonSeps;

1;

