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

package org::allbinary::logic::control::workflow::WorkFlowWrapper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::control::workflow::WorkFlowInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{anyType} = undef;
}


sub new {
    my ($class, $anyType) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{anyType} = $anyType;
    return $self;
}


sub getWorkFlowObject {
    my ($self) = @_;
        return $self->{anyType};
}


# throws Exception
sub getName {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->{anyType});
            my $method = $helperClass->getMethod("getName", undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            my $error = "Reflection Exception";
            if ($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getName()", $e);
            }
            die ($error);
        }
}


# throws Exception
sub getStoreName {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->{anyType});
            my $method = $helperClass->getMethod("getStoreName", undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            my $error = "Reflection Exception";
            if ($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getStoreName()", $e);
            }
            die ($error);
        }
}


# throws Exception
sub process {
    my ($self) = @_;
        try {
            my $helperClass = ref($self->{anyType});
            my $method = $helperClass->getMethod($self->{commonStrings}->{PROCESS}, undef);
            my $result = $method->invoke($self->{anyType}, undef);
            return $result;
        } catch ($e) {
            my $error = "Reflection Exception";
            if ($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::control::workflow::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
            }
            die ($error);
        }
}

# use java::lang::reflect::Method;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::control::workflow::WorkFlowInterface;

1;

