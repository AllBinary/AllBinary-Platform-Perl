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

package org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub process {
    my ($class, $imageActionScriptOutputInterface, $frame) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $logUtil->putF("Start - Processing at: " . $imageActionScriptOutputInterface->toString(), "ImageActionScriptOutputProcessor", $commonStrings->{PROCESS});
        my $imageTypes = $imageActionScriptOutputInterface->getImageTypes();
        my $vector = $imageTypes->getVector();
        my $size = $vector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $imageType = $vector->get($index);
            my $imageIOInterface = 'org::allbinary::input::media::image::InputImageIOInterfaceFactory'->getInstance($imageType);
            $imageIOInterface->save($frame);
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::media::image::InputImageIOInterfaceFactory;
use org::allbinary::input::media::image::InputImageType;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::image::io::ImageIOInterface;
use org::allbinary::string::CommonStrings;

1;

