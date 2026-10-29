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

package org::allbinary::input::media::image::capture::CapturedImageInputOutput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::io::ImageIOInterface';


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
sub save {
    my ($self, $frame) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $capturedBufferedImageCacheable = (('org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton'->getInstance())->get($frame));
        $self->{logUtil}->putF(("Saving: " . $capturedBufferedImageCacheable->toString()), $self, $commonStrings->{SAVE});
        $self->save($capturedBufferedImageCacheable->getBufferedImage(), $frame);
}


# Java overloaded method: Perl keeps the last definition
sub save {
    my ($self, $bufferedImage, $frame) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $imageUtil = 'org::allbinary::media::image::ImageUtil'->getInstance();
        my $filePathStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer->append($org::allbinary::input::automation::ImageOutputData::SAVE_PATH);
        $filePathStringBuffer->append('org::allbinary::logic::java::number::LongUtil'->fillIn(("" . ($frame))));
        $filePathStringBuffer->append('org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{JPG}->getExtension());
        my $filePath = $filePathStringBuffer->toString();
        $self->{logUtil}->putF(("Image File Path: " . $filePath . $imageUtil->toString($bufferedImage)), $self, $commonStrings->{SAVE});
        my $imagePersistanceUtil = 'org::allbinary::media::image::ImagePersistanceUtil'->getInstance();
        $imagePersistanceUtil->saveWithImageIO($filePath, $bufferedImage);
}

# use java::awt::image::BufferedImage;
use org::allbinary::input::automation::ImageOutputData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::number::LongUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::cache::AutomaticCacheInterface;
use org::allbinary::logic::visual::media::MediaDataFactory;
use org::allbinary::media::image::ImagePersistanceUtil;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::media::image::cache::BufferedImageFrameCacheable;
use org::allbinary::media::image::io::ImageIOInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton;

1;

