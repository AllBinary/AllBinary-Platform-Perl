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

package org::allbinary::logic::communication::smtp::event::EmailEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::util::EventObject';


sub _init_fields {
    my ($self) = @_;
    $self->{emailInfo} = undef;
    $self->{userEmailEventNameData} = undef;
    $self->{attempts} = 0;
}


sub new {
    my ($class, $emailEventHandler, $userEmailEventNameData, $emailInfo, $attempts) = @_;
    my $self = $class->SUPER::new($emailEventHandler);
    $self->_init_fields();
        # super(...) made $self above
        $self->{userEmailEventNameData} = $userEmailEventNameData;
        $self->{emailInfo} = $emailInfo;
    return $self;
}


sub getEmailInfo {
    my ($self) = @_;
        return $self->{emailInfo};
}


sub getAttempts {
    my ($self) = @_;
        return $self->{attempts};
}


sub setAttempts {
    my ($self, $attempts) = @_;
        $self->{attempts} = $attempts;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("EmailEvent Log: \n");
        $stringBuffer->append("Event Name: ");
        $stringBuffer->append($self->{userEmailEventNameData}->toString());
        $stringBuffer->append($self->getEmailInfo()->toString());
        $stringBuffer->append("\nNumber of Attempts: ");
        $stringBuffer->appendint($self->getAttempts());
        return $stringBuffer->toString();
}

# use java::util::EventObject;
use org::allbinary::logic::communication::smtp::info::EmailInfo;
use org::allbinary::logic::string::StringMaker;

1;

