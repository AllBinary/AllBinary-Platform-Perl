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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::communication::log::GuiLog'->new() };

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
    _init_fields($self);
    return $self;
}


sub showDialog {
    my ($self, $msg) = @_;
        my $error = 'javax::swing::JDialog'->new();
        my $size = length($msg) * 9;
        my $x = $size;
        if ($x > 550) {
            $x = 550;
        }
        $error->getContentPane()->setLayout('java::awt::GridLayout'->new(1, 1));
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


sub put_j3_1 {
    my ($self, $specialMessage, $anyType, $functionName) = @_;
        return $self->put($specialMessage, $anyType, $functionName, undef);
}


sub put_j4_1 {
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


sub put_j3_2 {
    my ($self, $specialMessage, $className, $functionName) = @_;
        return $self->put($specialMessage, $className, $functionName, undef);
}


sub put_j4_2 {
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

sub put {
    my ($invocant, @arguments) = @_;
    return $invocant->put_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->put_j4(@arguments) if scalar(@arguments) == 4;
    die "No method put takes " . scalar(@arguments) . " arguments";
}

sub put_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->put_j3_1(@arguments) if 1 && !ref($arguments[0]) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && !ref($arguments[2]);
    return $invocant->put_j3_2(@arguments);
}

sub put_j4 {
    my ($invocant, @arguments) = @_;
    return $invocant->put_j4_1(@arguments) if 1 && !ref($arguments[0]) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && !ref($arguments[2]) && (!defined($arguments[3]) || (ref($arguments[3]) && ref($arguments[3]) ne 'ARRAY'));
    return $invocant->put_j4_2(@arguments);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::awt::GridLayout ();
# use javax::swing::JDialog ();
use org::allbinary::string::CommonStrings ();
# use javax::swing::JLabel ();
# use javax::swing::JScrollPane ();
# use javax::swing::JTextArea ();
use org::allbinary::logic::communication::log::LogFormatUtil ();
use java::lang::System ();
use org::allbinary::logic::communication::log::PreLogUtil ();

1;

