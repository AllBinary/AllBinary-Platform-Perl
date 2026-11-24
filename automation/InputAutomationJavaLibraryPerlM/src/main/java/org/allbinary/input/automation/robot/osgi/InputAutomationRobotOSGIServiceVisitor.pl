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

package org::allbinary::input::automation::robot::osgi::InputAutomationRobotOSGIServiceVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::osgi::OSGIServiceVisitorInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub visit_j1_1 {
    my ($self, $anyType) = @_;
        return $self->visit($anyType);
}


sub visit_j1_2 {
    my ($self, $osgiServiceInterface) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "visit");
            my $inputAutomationRobotServiceInterface = $osgiServiceInterface;
            my $inputRobotInterfaceArray = $inputAutomationRobotServiceInterface->getInputRobotInterfaceArray();
            for (my $index = 0; $index < scalar(@{$inputRobotInterfaceArray}); $index++) {
                $self->{logUtil}->putF("Adding: " . $inputRobotInterfaceArray->[$index]->getName(), $self, "visit");
                'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->add($inputRobotInterfaceArray->[$index]);
            }
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "visit", $e);
            return 0;
        }
}

sub visit {
    my ($invocant, @arguments) = @_;
    return $invocant->visit_j1(@arguments) if scalar(@arguments) == 1;
    die "No method visit takes " . scalar(@arguments) . " arguments";
}

sub visit_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->visit_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->visit_j1_2(@arguments);
}

use java::lang::Object ();
use bundle::input::automation::robot::InputAutomationRobotServiceInterface ();
use org::allbinary::input::automation::robot::InputRobotFactory ();
use org::allbinary::input::automation::robot::InputRobotInterface ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::osgi::OSGIServiceInterface ();
use org::allbinary::osgi::OSGIServiceVisitorInterface ();
use org::allbinary::string::CommonStrings ();

1;

