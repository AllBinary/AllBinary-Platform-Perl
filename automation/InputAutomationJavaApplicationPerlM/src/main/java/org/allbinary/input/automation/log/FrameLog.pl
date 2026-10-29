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

package org::allbinary::input::automation::log::FrameLog;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $frameBytes = ("" . "Frame: ")->getBytes();
our $info = ("" . "Info: \n")->getBytes();
our $actions = ("" . "Actions: \n")->getBytes();

sub _init_fields {
    my ($self) = @_;
    $self->{frame} = undef;
    $self->{infoStringBuffer} = 'org::allbinary::logic::string::StringMaker'->new();
    $self->{actionsStringBuffer} = 'org::allbinary::logic::string::StringMaker'->new();
}


sub new {
    my ($class, $frame) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{frame} = $frame;
    return $self;
}


sub addInfo {
    my ($self, $infoString) = @_;
        $self->{infoStringBuffer}->append($infoString);
}


sub addActions {
    my ($self, $vectorOfStrings) = @_;
        my $size = $vectorOfStrings->size();
        for (my $index = 0; $index < $size; $index++) {
            $self->addAction($vectorOfStrings->get($index));
        }
}


sub addAction {
    my ($self, $action) = @_;
        $self->{actionsStringBuffer}->append($action);
        $self->{actionsStringBuffer}->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
}


# throws Exception
sub write {
    my ($self) = @_;
        my $filePathStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer->append($org::allbinary::input::automation::ImageOutputData::SAVE_PATH);
        $filePathStringBuffer->append('org::allbinary::logic::java::number::LongUtil'->fillIn(("" . ($self->{frame}))));
        $filePathStringBuffer->append(".txt");
        my $filePath = $filePathStringBuffer->toString();
        my $fileOutputStream = 'java::io::FileOutputStream'->new('java::io::File'->new($filePath));
        $fileOutputStream->write($org::allbinary::input::automation::log::FrameLog::frameBytes);
        $fileOutputStream->write([unpack("C*", $self->getFrame()->toString())]);
        $fileOutputStream->write("\n");
        $fileOutputStream->write($org::allbinary::input::automation::log::FrameLog::info);
        $fileOutputStream->write([unpack("C*", $self->{infoStringBuffer}->toString())]);
        $fileOutputStream->write("\n");
        $fileOutputStream->write($org::allbinary::input::automation::log::FrameLog::actions);
        $fileOutputStream->write([unpack("C*", $self->{actionsStringBuffer}->toString())]);
        $fileOutputStream->close();
}


sub getFrame {
    my ($self) = @_;
        return $self->{frame};
}

use java::io::File;
# use java::io::FileOutputStream;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::automation::ImageOutputData;
use org::allbinary::logic::java::number::LongUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonSeps;

1;

