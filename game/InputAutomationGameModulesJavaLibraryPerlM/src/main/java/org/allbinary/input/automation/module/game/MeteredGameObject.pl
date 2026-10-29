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

package org::allbinary::input::automation::module::game::MeteredGameObject;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::game::MeteredGameObjectInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{ratios} = undef;
    $self->{good} = 0;
    $self->{dropping} = 0;
    $self->{minX} = undef;
    $self->{maxX} = undef;
    $self->{y} = undef;
    $self->{size} = undef;
    $self->{RATIOS_LABEL} = "Ratios: ";
    $self->{IS_GOOD_LABEL} = "isGood: ";
    $self->{IS_DROPPPING_LABEL} = "isDropping: ";
}


sub new {
    my ($class, $bufferedImage, $minX, $maxX, $y) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setRatios([(undef) x (scalar(@{$bufferedImage}))]);
        $self->setMinX($minX);
        $self->setMaxX($maxX);
        $self->setY($y);
        $self->setSize($maxX - $minX);
        for (my $index = 0; $index < scalar(@{$bufferedImage}); $index++) {
            my $nominator = 'org::allbinary::input::automation::module::game::GraphicsAnalysisUtil'->getNominator($bufferedImage->[$index], $self->getMinX(), $self->getMaxX(), $self->getY());
            $self->getRatios()->[$index] = $nominator / $self->getSize();
        }
        if ($self->getRatios()->[scalar(@{$bufferedImage}) - 1] > 0.93) {
            $self->setGood(1);
        } else {
            $self->setGood(0);
        }
        if ($self->getRatios()->[scalar(@{$bufferedImage}) - 1] < $self->getRatios()->[0]) {
            $self->setDropping(1);
        } else {
            $self->setDropping(0);
        }
    return $self;
}


sub isGood {
    my ($self) = @_;
        return $self->{good};
}


sub setGood {
    my ($self, $good) = @_;
        $self->{good} = $good;
}


sub isDropping {
    my ($self) = @_;
        return $self->{dropping};
}


sub setDropping {
    my ($self, $dropping) = @_;
        $self->{dropping} = $dropping;
}


sub getRatios {
    my ($self) = @_;
        return $self->{ratios};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append($self->{RATIOS_LABEL});
        for (my $index = 0; $index < scalar(@{$self->getRatios()}); $index++) {
            $stringBuffer->append($self->getRatios()->[$index]->toString());
            if ($index < scalar(@{$self->getRatios()}) - 1) {
                $stringBuffer->append($commonSeps->{COMMA_SEP});
            }
        }
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append($self->{IS_GOOD_LABEL});
        $stringBuffer->appendboolean($self->isGood());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append($self->{IS_DROPPPING_LABEL});
        $stringBuffer->appendboolean($self->isDropping());
        return $stringBuffer->toString();
}


sub setRatios {
    my ($self, $ratios) = @_;
        $self->{ratios} = $ratios;
}


sub getMinX {
    my ($self) = @_;
        return $self->{minX};
}


sub setMinX {
    my ($self, $minX) = @_;
        $self->{minX} = $minX;
}


sub getMaxX {
    my ($self) = @_;
        return $self->{maxX};
}


sub setMaxX {
    my ($self, $maxX) = @_;
        $self->{maxX} = $maxX;
}


sub getY {
    my ($self) = @_;
        return $self->{y};
}


sub setY {
    my ($self, $y) = @_;
        $self->{y} = $y;
}


sub getSize {
    my ($self) = @_;
        return $self->{size};
}


sub setSize {
    my ($self, $size) = @_;
        $self->{size} = $size;
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::input::automation::module::game::MeteredGameObjectInterface;
use org::allbinary::input::automation::module::game::GraphicsAnalysisUtil;

1;

