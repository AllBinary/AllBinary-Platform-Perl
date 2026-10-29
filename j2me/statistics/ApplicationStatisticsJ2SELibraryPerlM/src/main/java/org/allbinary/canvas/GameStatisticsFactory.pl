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

#ActualPlatform
package org::allbinary::canvas::GameStatisticsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::canvas::BaseGameStatistics';

our $instance = 'org::allbinary::canvas::GameStatisticsFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{stringBuffer} = 'org::allbinary::logic::string::StringMaker'->new();
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::canvas::GameStatisticsFactory::instance;
}


sub add {
    my ($self, $string) = @_;
        if ($self->{stringBuffer}->length() > 12000) {
            $self->{stringBuffer}->delete(0, $self->{stringBuffer}->length());
            $self->{stringBuffer}->append("Old Stats Cleared");
        }
        $self->{stringBuffer}->append($string);
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->SUPER::toString())->append($self->{stringBuffer}->toString())->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::canvas::BaseGameStatistics;

1;

