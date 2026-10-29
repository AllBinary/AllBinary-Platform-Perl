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

package org::allbinary::animation::vector::VectorCenterGenerator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{minX} = 2147483647;
    $self->{minY} = 2147483647;
    $self->{maxX} = (-2147483648);
    $self->{maxY} = (-2147483648);
    $self->{dx} = 0;
    $self->{dy} = 0;
    $self->{width} = 0;
    $self->{height} = 0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub calculate {
    my ($self, $hashMap) = @_;
        my $graphicItemArray = $hashMap->keySet()->toArray();
        my $size = scalar(@{$graphicItemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $hashMap->get($graphicItemArray->[$index]);
            if ($item->getName() eq 'org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem'->getStaticName()) {
                $self->getInstance($item->getPointsInterface()->getPoints());
            }
        }
        $self->{logUtil}->putF("minX: " . $self->{minX} . " minY: " . $self->{minY} . " maxX: " . $self->{maxX} . " maxY: " . $self->{maxY}, $self, $self->{commonStrings}->{GET_INSTANCE});
        $self->setWidth($self->{maxX} - $self->{minX});
        $self->setHeight($self->{maxY} - $self->{minY});
        my $max = $self->getWidth();
        if ($self->getHeight() > $max) {
            $max = $self->getHeight();
        }
        my $middle = int($max / 2);
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $s = 'org::allbinary::logic::string::StringMaker'->new()->append($commonLabels->{WIDTH_LABEL})->appendint($self->getWidth())->append($commonLabels->{HEIGHT_LABEL})->appendint($self->getHeight())->append(" max: ")->appendint($max)->append(" middle: ")->appendint($middle)->toString();
        $self->{logUtil}->putF($s, $self, $self->{commonStrings}->{GET_INSTANCE});
        my $currentMiddleX = $self->{minX} + int($self->getWidth() / 2);
        my $currentMiddleY = $self->{minY} + int($self->getHeight() / 2);
        $self->{dx} = $middle - $currentMiddleX;
        $self->{dy} = $middle - $currentMiddleY;
}


# throws Exception
sub transform {
    my ($self, $hashMap) = @_;
        $self->calculate($hashMap);
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append(" dx: ")->appendint($self->{dx})->append(" dy: ")->appendint($self->{dy})->toString(), $self, $self->{commonStrings}->{GET_INSTANCE});
        my $graphicItemArray = $hashMap->keySet()->toArray();
        my $size = scalar(@{$graphicItemArray});
        for (my $index = 0; $index < $size; $index++) {
            my $item = $hashMap->get($graphicItemArray->[$index]);
            my $list = 'org::allbinary::animation::vector::VectorCenterGenerator'->translate($item->getPointsInterface()->getPoints(), $self->{dx}, $self->{dy});
            my $newPoints = 'org::allbinary::graphics::j2me::workarea::tools::Points'->new();
            $newPoints->addPoints($list);
            $item->setPointsInterface($newPoints);
        }
}


# throws Exception
sub getInstance {
    my ($self, $pointVector) = @_;
        try {
            my $size = $pointVector->size();
            for (my $index = 0; $index < $size; $index++) {
                my $point = $pointVector->get($index);
                if ($point->getX() < $self->{minX}) {
                    $self->{minX} = $point->getX();
                }
                if ($point->getX() > $self->{maxX}) {
                    $self->{maxX} = $point->getX();
                }
                if ($point->getY() < $self->{minY}) {
                    $self->{minY} = $point->getY();
                }
                if ($point->getY() > $self->{maxY}) {
                    $self->{maxY} = $point->getY();
                }
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET_INSTANCE}, $e);
            die $e;
        }
}


# throws Exception
sub translate {
    my ($class, $list, $x, $y) = @_;
        my $graphicsPipe = 'org::allbinary::graphics::pipeline::BasicGraphicsPipeline'->new($list);
        $graphicsPipe->createMatrix();
        $graphicsPipe->translate($x, $y);
        return $graphicsPipe->getMatrix();
}


sub getWidth {
    my ($self) = @_;
        return $self->{width};
}


sub setWidth {
    my ($self, $width) = @_;
        $self->{width} = $width;
}


sub getHeight {
    my ($self) = @_;
        return $self->{height};
}


sub setHeight {
    my ($self, $height) = @_;
        $self->{height} = $height;
}

use java::util::HashMap;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::j2me::workarea::tools::GraphicItemInterface;
use org::allbinary::graphics::j2me::workarea::tools::LinesGraphicItem;
use org::allbinary::graphics::j2me::workarea::tools::Points;
use org::allbinary::graphics::pipeline::BasicGraphicsPipeline;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;

1;

