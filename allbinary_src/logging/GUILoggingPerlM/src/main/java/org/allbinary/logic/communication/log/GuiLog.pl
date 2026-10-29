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

package org::allbinary::logic::communication::log::GuiLog;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::log::GuiLog'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logFormatUtil} = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::GuiLog::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub showDialog {
    my ($self, $msg) = @_;
        my $error = 'org::allbinary::logic::communication::log::JDialog'->new();
        my $size = length($msg) * 9;
        my $x = $size;
        if ($x > 550) {
            $x = 550;
        }
        $error->getContentPane()->setLayout('org::allbinary::logic::communication::log::GridLayout'->new(1, 1));
        if ($size > 255) {
            my $y = 550;
            $error->setSize($x, $y);
            $error->getContentPane()->add('javax::swing::JScrollPane'->new('javax::swing::JTextArea'->new($msg)));
        } elsif ($size > 0) {
            my $y = 50;
            $error->setSize($x, $y);
            $error->getContentPane()->add('javax::swing::JScrollPane'->new('javax::swing::JLabel'->new($msg)));
        }
        $error->show();
}


sub put {
    my ($self, $specialMessage, $anyType, $functionName) = @_;
        return $self->put($specialMessage, $anyType, $functionName, undef);
}


# Java overloaded method: Perl keeps the last definition
sub put {
    my ($self, $specialMessage, $anyType, $functionName, $exception) = @_;
        try {
            my $data = $self->{logFormatUtil}->get($specialMessage, ref($anyType), $functionName, $exception);
            $self->showDialog($data);
            print($data, "\n");
            return $data;
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, "put", $e);
            return "Logging Error";
        }
}


# Java overloaded method: Perl keeps the last definition
sub put {
    my ($self, $specialMessage, $className, $functionName) = @_;
        return $self->put($specialMessage, $className, $functionName, undef);
}


# Java overloaded method: Perl keeps the last definition
sub put {
    my ($self, $specialMessage, $className, $functionName, $exception) = @_;
        try {
            my $data = $self->{logFormatUtil}->get($specialMessage, $className, $functionName, $exception);
            $self->showDialog($data);
            print($data, "\n");
            return $data;
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($self->{commonStrings}->{EXCEPTION}, $self, "put", $e);
            return "Logging Error";
        }
}

# use java::awt;
# use javax::swing;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogFormatUtil;
use org::allbinary::logic::communication::log::JDialog;
use org::allbinary::logic::communication::log::GridLayout;
use java::lang::System;
use org::allbinary::logic::communication::log::PreLogUtil;

1;

