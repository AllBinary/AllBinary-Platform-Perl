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

package org::allbinary::graphics::CellPosition;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graph::V';


sub _init_fields {
    my ($self) = @_;
    $self->{id} = undef;
    $self->{column} = undef;
    $self->{row} = undef;
}


sub new {
    my ($class, $column, $row, $columns, $rows) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{column} = $column;
        $self->{row} = $row;
        $self->{id} = ($row * $columns) + $column;
    return $self;
}


sub getColumn {
    my ($self) = @_;
        return $self->{column};
}


sub getRow {
    my ($self) = @_;
        return $self->{row};
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::graphics::CellPosition'->toStringColRow($self->getColumn(), $self->getRow());
}


sub toStringCellPosition {
    my ($class, $basicGeographicMapCellPosition) = @_;
        return 'org::allbinary::graphics::CellPosition'->toStringColRow($basicGeographicMapCellPosition->getColumn(), $basicGeographicMapCellPosition->getRow());
}


sub toStringColRow {
    my ($class, $i_column, $i_row) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $stringBuffer->append($commonSeps->{PARENTHESIS_OPEN});
        $stringBuffer->appendint($i_column);
        $stringBuffer->append($commonSeps->{COMMA});
        $stringBuffer->appendint($i_row);
        $stringBuffer->append($commonSeps->{PARENTHESIS_CLOSE});
        return $stringBuffer->toString();
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}

use org::allbinary::graph::V;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

