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

package org::allbinary::logic::communication::http::AcceptableResponse;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class, $candidate, $tagName, $index) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logUtil}->putF($tagName, $self, $self->{commonStrings}->{CONSTRUCTOR});
        my $acceptableResponseUtil = 'org::allbinary::logic::communication::http::AcceptableResponseUtil'->getInstance();
        $acceptableResponseUtil->{candidateVector}->addAt($index, $candidate);
        $acceptableResponseUtil->{tagNameVector}->addAt($index, $tagName);
    return $self;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::http::AcceptableResponseUtil;

1;

