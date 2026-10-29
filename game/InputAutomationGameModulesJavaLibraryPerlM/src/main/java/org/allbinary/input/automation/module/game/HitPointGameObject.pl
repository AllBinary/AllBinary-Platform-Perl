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

package org::allbinary::input::automation::module::game::HitPointGameObject;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::game::MeteredGameObject','org::allbinary::input::automation::module::game::HitPointGameObjectInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{damaged} = 0;
    $self->{closeDeath} = 0;
    $self->{HP_LABEL} = "HP: ";
    $self->{IS_DAMAGED_LABEL} = "isDamaged: ";
    $self->{IS_CLOSE_DEATH_LABEL} = "isCloseDeath: ";
}


sub new {
    my ($class, $bufferedImage, $minX, $maxX, $y) = @_;
    my $self = $class->SUPER::new($bufferedImage, $minX, $maxX, $y);
    $self->_init_fields();
        # super(...) made $self above
        if ($self->getRatios()->[scalar(@{$bufferedImage}) - 1] < 1.0) {
            $self->setDamaged(1);
        } else {
            $self->setDamaged(0);
        }
        if ($self->getRatios()->[scalar(@{$bufferedImage}) - 1] > 0.25) {
            $self->{closeDeath} = 0;
        } else {
            $self->{closeDeath} = 1;
        }
    return $self;
}


sub isMoreThan {
    my ($self, $aFloat) = @_;
        if ($self->getRatios()->[scalar(@{$self->getRatios()}) - 1] > $aFloat) {
            return 1;
        } else {
            return 0;
        }
}


sub isCloseDeath {
    my ($self) = @_;
        return $self->{closeDeath};
}


sub setCloseDeath {
    my ($self, $closeDeath) = @_;
        $self->{closeDeath} = $closeDeath;
}


sub isDamaged {
    my ($self) = @_;
        return $self->{damaged};
}


sub setDamaged {
    my ($self, $damaged) = @_;
        $self->{damaged} = $damaged;
}


sub toString {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->{HP_LABEL});
        $stringBuffer->append($self->SUPER::toString());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append($self->{IS_DAMAGED_LABEL});
        $stringBuffer->appendboolean($self->isDamaged());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append($self->{IS_CLOSE_DEATH_LABEL});
        $stringBuffer->appendboolean($self->isCloseDeath());
        return $stringBuffer->toString();
}

# use java::awt::image::BufferedImage;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;
use org::allbinary::input::automation::module::game::MeteredGameObject;
use org::allbinary::input::automation::module::game::HitPointGameObjectInterface;

1;

