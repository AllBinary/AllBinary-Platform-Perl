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

package org::allbinary::media::image::analysis::ColorAverage;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{avgRed} = 0.0;
    $self->{avgGreen} = 0.0;
    $self->{avgBlue} = 0.0;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setAvgRed(0);
        $self->setAvgGreen(0);
        $self->setAvgBlue(0);
    return $self;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("getAvgRed(): ");
        $stringBuffer->appendfloat($self->getAvgRed());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append("getAvgRed(): ");
        $stringBuffer->appendfloat($self->getAvgRed());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        $stringBuffer->append("getAvgGreen(): ");
        $stringBuffer->appendfloat($self->getAvgGreen());
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        return $stringBuffer->toString();
}


sub getAvgRed {
    my ($self) = @_;
        return $self->{avgRed};
}


sub setAvgRed {
    my ($self, $avgRed) = @_;
        $self->{avgRed} = $avgRed;
}


sub getAvgGreen {
    my ($self) = @_;
        return $self->{avgGreen};
}


sub setAvgGreen {
    my ($self, $avgGreen) = @_;
        $self->{avgGreen} = $avgGreen;
}


sub getAvgBlue {
    my ($self) = @_;
        return $self->{avgBlue};
}


sub setAvgBlue {
    my ($self, $avgBlue) = @_;
        $self->{avgBlue} = $avgBlue;
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

