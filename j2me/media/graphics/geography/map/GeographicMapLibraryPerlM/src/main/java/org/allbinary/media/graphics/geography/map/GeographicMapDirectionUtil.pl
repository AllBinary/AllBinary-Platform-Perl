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

package org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{MESSAGE} = "Cell Position should have been cached!!!";
    $self->{ERROR} = "Error: ";
    $self->{EQUAL} = " == ";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::graphics::geography::map::GeographicMapDirectionUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getDirectionFromCellPositionToAdjacentCellPosition {
    my ($self, $fromGeographicMapCellPosition, $toGeographicMapCellPosition) = @_;
        my $fromColumn = $fromGeographicMapCellPosition->getColumn();
        my $fromRow = $fromGeographicMapCellPosition->getRow();
        my $goColumn = $toGeographicMapCellPosition->getColumn();
        my $goRow = $toGeographicMapCellPosition->getRow();
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        if ($fromColumn - 1 == $goColumn) {
            return $directionFactory->{LEFT};
        } elsif ($fromColumn + 1 == $goColumn) {
            return $directionFactory->{RIGHT};
        } elsif ($fromRow - 1 == $goRow) {
            return $directionFactory->{UP};
        } elsif ($fromRow + 1 == $goRow) {
            return $directionFactory->{DOWN};
        } elsif ($fromGeographicMapCellPosition == $toGeographicMapCellPosition) {
            return $directionFactory->{NO_DIRECTION};
        } elsif ($fromRow == $goRow && $fromColumn == $goColumn) {
            die ($self->{MESSAGE});
        }
        return $directionFactory->{NOT_BORDERED_WITH};
}


# throws Exception
sub getEightDirectionFromCellPositionToAdjacentCellPosition {
    my ($self, $fromGeographicMapCellPosition, $toGeographicMapCellPosition) = @_;
        my $fromColumn = $fromGeographicMapCellPosition->getColumn();
        my $fromRow = $fromGeographicMapCellPosition->getRow();
        my $goColumn = $toGeographicMapCellPosition->getColumn();
        my $goRow = $toGeographicMapCellPosition->getRow();
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        if ($fromRow == $goRow) {
            if ($fromColumn - 1 == $goColumn) {
                return $directionFactory->{LEFT};
            } elsif ($fromColumn + 1 == $goColumn) {
                return $directionFactory->{RIGHT};
            }
        } elsif ($fromRow - 1 == $goRow) {
            if ($fromColumn == $goColumn) {
                return $directionFactory->{UP};
            }
            if ($fromColumn - 1 == $goColumn) {
                return $directionFactory->{UP_LEFT};
            } elsif ($fromColumn + 1 == $goColumn) {
                return $directionFactory->{UP_RIGHT};
            }
        } elsif ($fromRow + 1 == $goRow) {
            if ($fromColumn == $goColumn) {
                return $directionFactory->{DOWN};
            }
            if ($fromColumn - 1 == $goColumn) {
                return $directionFactory->{DOWN_LEFT};
            } elsif ($fromColumn + 1 == $goColumn) {
                return $directionFactory->{DOWN_RIGHT};
            }
        } elsif ($fromGeographicMapCellPosition == $toGeographicMapCellPosition) {
            return $directionFactory->{NO_DIRECTION};
        } elsif ($fromRow == $goRow && $fromColumn == $goColumn) {
            die ($self->{MESSAGE});
        }
        return $directionFactory->{NOT_BORDERED_WITH};
}


# throws Exception
sub getDirectionFromCellPositionToCellPosition {
    my ($self, $fromGeographicMapCellPosition, $toGeographicMapCellPosition) = @_;
        my $fromColumn = $fromGeographicMapCellPosition->getColumn();
        my $fromRow = $fromGeographicMapCellPosition->getRow();
        my $goColumn = $toGeographicMapCellPosition->getColumn();
        my $goRow = $toGeographicMapCellPosition->getRow();
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        if ($fromColumn > $goColumn) {
            return $directionFactory->{LEFT};
        } elsif ($fromColumn < $goColumn) {
            return $directionFactory->{RIGHT};
        } elsif ($fromRow > $goRow) {
            return $directionFactory->{UP};
        } elsif ($fromRow < $goRow) {
            return $directionFactory->{DOWN};
        }
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $string = $stringMaker->append('org::allbinary::graphics::CellPosition'->toStringCellPosition($fromGeographicMapCellPosition))->append(" == ")->append('org::allbinary::graphics::CellPosition'->toStringCellPosition($toGeographicMapCellPosition))->toString();
        $stringMaker->delete(0, $stringMaker->length());
        die ($stringMaker->append("Error: ")->append($string)->toString());
}


# throws Exception
sub getEightDirectionFromCellPositionToCellPosition {
    my ($self, $fromGeographicMapCellPosition, $toGeographicMapCellPosition) = @_;
        my $fromColumn = $fromGeographicMapCellPosition->getColumn();
        my $fromRow = $fromGeographicMapCellPosition->getRow();
        my $goColumn = $toGeographicMapCellPosition->getColumn();
        my $goRow = $toGeographicMapCellPosition->getRow();
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        if ($fromGeographicMapCellPosition == $toGeographicMapCellPosition) {
            return $directionFactory->{NO_DIRECTION};
        } elsif ($fromRow == $goRow) {
            if ($fromColumn > $goColumn) {
                return $directionFactory->{LEFT};
            } elsif ($fromColumn < $goColumn) {
                return $directionFactory->{RIGHT};
            }
        } elsif ($fromRow > $goRow) {
            if ($fromColumn > $goColumn) {
                return $directionFactory->{UP_LEFT};
            } elsif ($fromColumn < $goColumn) {
                return $directionFactory->{UP_RIGHT};
            } elsif ($fromColumn == $goColumn) {
                return $directionFactory->{UP};
            }
        } elsif ($fromRow < $goRow) {
            if ($fromColumn > $goColumn) {
                return $directionFactory->{DOWN_LEFT};
            } elsif ($fromColumn < $goColumn) {
                return $directionFactory->{DOWN_RIGHT};
            } elsif ($fromColumn == $goColumn) {
                return $directionFactory->{DOWN};
            }
        }
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{ERROR});
        $stringBuffer->append('org::allbinary::graphics::CellPosition'->toStringCellPosition($fromGeographicMapCellPosition));
        $stringBuffer->append($self->{EQUAL});
        $stringBuffer->append('org::allbinary::graphics::CellPosition'->toStringCellPosition($toGeographicMapCellPosition));
        die ($stringBuffer->toString());
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::graphics::CellPosition;

1;

