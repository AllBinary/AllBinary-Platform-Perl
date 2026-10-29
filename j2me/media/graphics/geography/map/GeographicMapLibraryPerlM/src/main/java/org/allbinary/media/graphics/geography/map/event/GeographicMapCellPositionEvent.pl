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

package org::allbinary::media::graphics::geography::map::event::GeographicMapCellPositionEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{geographicMapCellPosition} = 'org::allbinary::graphics::CellPositionFactory'->getInstance()->{NONE};
}


sub new {
    my ($class, $anyType, $geographicMapCellPosition) = @_;
    my $self = $class->SUPER::new($anyType);
    $self->_init_fields();
        # super(...) made $self above
        $self->{geographicMapCellPosition} = $geographicMapCellPosition;
    return $self;
}


sub init {
    my ($self, $anyType) = @_;
        $self->setSource($anyType);
}


sub setGeographicMapCellPosition {
    my ($self, $geographicMapCellPosition) = @_;
        $self->{geographicMapCellPosition} = $geographicMapCellPosition;
}


sub getGeographicMapCellPosition {
    my ($self) = @_;
        return $self->{geographicMapCellPosition};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("CellPositionEvent: ");
        $stringBuffer->append("\nGeographicMapCellPosition: ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->getGeographicMapCellPosition()));
        return $stringBuffer->toString();
}

use org::allbinary::graphics::CellPosition;
use org::allbinary::graphics::CellPositionFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::media::graphics::geography::map::GeographicMapCellPosition;

1;

