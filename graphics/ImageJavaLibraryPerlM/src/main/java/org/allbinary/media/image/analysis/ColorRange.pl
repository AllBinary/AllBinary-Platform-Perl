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

package org::allbinary::media::image::analysis::ColorRange;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::media::image::analysis::ColorRangeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{minRed} = undef unless exists $self->{minRed};
    $self->{maxRed} = undef unless exists $self->{maxRed};
    $self->{minGreen} = undef unless exists $self->{minGreen};
    $self->{maxGreen} = undef unless exists $self->{maxGreen};
    $self->{minBlue} = undef unless exists $self->{minBlue};
    $self->{maxBlue} = undef unless exists $self->{maxBlue};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{minRed} = 0;
        $self->{maxRed} = 0;
        $self->{minGreen} = 0;
        $self->{maxGreen} = 0;
        $self->{minBlue} = 0;
        $self->{maxBlue} = 0;
    return $self;
}


sub getMinRed {
    my ($self) = @_;
        return $self->{minRed};
}


sub setMinRed {
    my ($self, $minRed) = @_;
        $self->{minRed} = $minRed;
}


sub getMaxRed {
    my ($self) = @_;
        return $self->{maxRed};
}


sub setMaxRed {
    my ($self, $maxRed) = @_;
        $self->{maxRed} = $maxRed;
}


sub getMinGreen {
    my ($self) = @_;
        return $self->{minGreen};
}


sub setMinGreen {
    my ($self, $minGreen) = @_;
        $self->{minGreen} = $minGreen;
}


sub getMaxGreen {
    my ($self) = @_;
        return $self->{maxGreen};
}


sub setMaxGreen {
    my ($self, $maxGreen) = @_;
        $self->{maxGreen} = $maxGreen;
}


sub getMinBlue {
    my ($self) = @_;
        return $self->{minBlue};
}


sub setMinBlue {
    my ($self, $minBlue) = @_;
        $self->{minBlue} = $minBlue;
}


sub getMaxBlue {
    my ($self) = @_;
        return $self->{maxBlue};
}


sub setMaxBlue {
    my ($self, $maxBlue) = @_;
        $self->{maxBlue} = $maxBlue;
}


sub isInRange {
    my ($self, $color) = @_;
        if ($color->getRed() >= $self->getMinRed() && $color->getRed() <= $self->getMaxRed() && $color->getGreen() >= $self->getMinGreen() && $color->getGreen() <= $self->getMaxGreen() && $color->getBlue() >= $self->getMinBlue() && $color->getBlue() <= $self->getMaxBlue()) {
            return 1;
        } else {
            return 0;
        }
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("getMinRed(): ");
        $stringBuffer->appendint($self->getMinRed());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append("getMaxRed(): ");
        $stringBuffer->appendint($self->getMaxRed());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append("getMinGreen(): ");
        $stringBuffer->appendint($self->getMinGreen());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append("getMaxGreen(): ");
        $stringBuffer->appendint($self->getMaxGreen());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append("getMinBlue(): ");
        $stringBuffer->appendint($self->getMinGreen());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append("getMaxBlue(): ");
        $stringBuffer->appendint($self->getMaxBlue());
        return $stringBuffer->toString();
}

use java::lang::Object ();
# use java::awt::Color ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::string::CommonSeps ();
use org::allbinary::media::image::analysis::ColorRangeInterface ();

1;

