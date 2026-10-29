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

package org::allbinary::input::media::image::capture::ScreenScavangerRobot;
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
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getScreenAsBufferedImages {
    my ($self) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getScreenAsBufferedImages");
        my $dimScreenSize = 'java::awt::Toolkit'->getDefaultToolkit()->getScreenSize();
        my $rectScreenSize = 'java::awt::Rectangle'->new($dimScreenSize);
        my $robotHashtable = 'org::allbinary::input::automation::robot::InputRobotFactory'->getInstance()->get();
        my $bufferedImageArray = [(undef) x (1)];
        my $index = 0;
        my $inputRobotInterface = $robotHashtable->get("Java Robot");
        $bufferedImageArray->[$index] = $inputRobotInterface->createScreenCapture($rectScreenSize);
        $self->{logUtil}->putF("Finish", $self, "getScreenAsBufferedImages");
        return $bufferedImageArray;
}

# use java::awt::Dimension;
# use java::awt::Rectangle;
# use java::awt::Toolkit;
# use java::awt::image::BufferedImage;
use org::allbinary::input::automation::robot::InputRobotFactory;
use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;

1;

