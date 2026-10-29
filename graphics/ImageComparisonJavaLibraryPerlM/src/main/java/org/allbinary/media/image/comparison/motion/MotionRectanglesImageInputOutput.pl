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

package org::allbinary::media::image::comparison::motion::MotionRectanglesImageInputOutput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::media::image::io::ImageIOInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{NUMBER_OF_IMAGES} = 1;
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
        my $motionRectanglesResultsFrameCacheable = ('org::allbinary::media::image::comparison::motion::AllMotionRectanglesResultsCacheSingleton'->getInstance())->get($frame);
        if (defined($motionRectanglesResultsFrameCacheable)) {
            my $motionRectangles = $motionRectanglesResultsFrameCacheable->getMotionRectangles();
            $self->save($motionRectangles, $frame);
            $motionRectanglesResultsFrameCacheable = ('org::allbinary::media::image::comparison::motion::ConsolidatedMotionRectanglesResultsCacheSingleton'->getInstance())->get($frame);
            $motionRectangles = $motionRectanglesResultsFrameCacheable->getMotionRectangles();
            $self->save($motionRectangles, $frame);
            $motionRectanglesResultsFrameCacheable = ('org::allbinary::media::image::comparison::motion::ConstrainedMotionRectanglesResultsCacheSingleton'->getInstance())->get($frame);
            $motionRectangles = $motionRectanglesResultsFrameCacheable->getMotionRectangles();
            $self->save($motionRectangles, $frame);
        } else {
            $self->{logUtil}->putF("No Motion Rectangle Results for Frame: " . $frame, $self, $commonStrings->{SAVE});
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub save {
    my ($self, $motionRectangles, $frame) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $filePathStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer->append($org::allbinary::input::automation::ImageOutputData::SAVE_PATH);
        $filePathStringBuffer->append('org::allbinary::logic::java::number::LongUtil'->fillIn(("" . ($frame))));
        $filePathStringBuffer->append("_");
        $filePathStringBuffer->append($motionRectangles->getName());
        my $filePathStringBuffer1 = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer1->append($filePathStringBuffer->toString());
        $filePathStringBuffer1->append("_1");
        $filePathStringBuffer1->append('org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{JPG}->getExtension());
        my $filePathStringBuffer2 = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer2->append($filePathStringBuffer->toString());
        $filePathStringBuffer2->append("_2");
        $filePathStringBuffer2->append('org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{JPG}->getExtension());
        my $filePathStringBuffer3 = 'org::allbinary::logic::string::StringMaker'->new();
        $filePathStringBuffer3->append($filePathStringBuffer->toString());
        $filePathStringBuffer3->append('org::allbinary::logic::visual::media::MediaDataFactory'->getInstance()->{JPG}->getExtension());
        $self->{logUtil}->putF("Motion Image File Path 1: " . $filePathStringBuffer1->toString(), $self, $commonStrings->{SAVE});
        $self->{logUtil}->putF("Motion Image File Path 2: " . $filePathStringBuffer2->toString(), $self, $commonStrings->{SAVE});
        $self->{logUtil}->putF("Motion Image File Path 2: " . $filePathStringBuffer3->toString(), $self, $commonStrings->{SAVE});
        my $bufferedImageCacheables = [(undef) x ($self->{NUMBER_OF_IMAGES})];
        my $imageComparisonInfo = $motionRectangles->getImageComparisonResult();
        my $originalBufferedImage = $imageComparisonInfo->getBufferedImages()->[0];
        my $bufferedImageInfo = 'org::allbinary::media::image::cache::BufferedImageInfoFactory'->getInstance($imageComparisonInfo->{imageWidth}, $imageComparisonInfo->{imageHeight}, $originalBufferedImage->getType());
        my $poolInterface = 'org::allbinary::media::image::cache::BufferedImagePoolSingleton'->getInstance();
        for (my $index = 0; $index < $self->{NUMBER_OF_IMAGES}; $index++) {
            $bufferedImageCacheables->[$index] = $poolInterface->remove($bufferedImageInfo);
        }
        $bufferedImageCacheables->[0]->getBufferedImage()->setData($imageComparisonInfo->getBufferedImages()->[1]->getData());
        if ($self->{NUMBER_OF_IMAGES} > 1) {
            $bufferedImageCacheables->[1]->getBufferedImage()->setData($imageComparisonInfo->getBufferedImages()->[1]->getData());
        }
        my $bufferedImageGraphicsArray = undef;
        $bufferedImageGraphicsArray = [(undef) x ($self->{NUMBER_OF_IMAGES})];
        for (my $index = 0; $index < $self->{NUMBER_OF_IMAGES}; $index++) {
            $bufferedImageGraphicsArray->[$index] = $bufferedImageCacheables->[$index]->getBufferedImage()->getGraphics();
        }
        my $rectangelList = $motionRectangles->getVector();
        my $size = $rectangelList->size();
        for (my $index2 = 0; $index2 < $size; $index2++) {
            my $motionRectangle = $rectangelList->get($index2);
            my $rectangle = $motionRectangle->getRectangle();
            for (my $index = 0; $index < $self->{NUMBER_OF_IMAGES}; $index++) {
                $bufferedImageGraphicsArray->[$index]->setColor($org::allbinary::media::image::comparison::motion::Color::ORANGE);
                $bufferedImageGraphicsArray->[$index]->drawRect($rectangle->{x}, $rectangle->{y}, $rectangle->{width}, $rectangle->{height});
            }
        }
        my $imagePersistanceUtil = 'org::allbinary::media::image::ImagePersistanceUtil'->getInstance();
        if ($self->{NUMBER_OF_IMAGES} > 1) {
            $imagePersistanceUtil->saveWithImageIO($filePathStringBuffer1->toString(), $bufferedImageCacheables->[1]->getBufferedImage());
        }
        $imagePersistanceUtil->saveWithImageIO($filePathStringBuffer2->toString(), $bufferedImageCacheables->[0]->getBufferedImage());
        if ($self->{NUMBER_OF_IMAGES} > 2) {
            $imagePersistanceUtil->saveWithImageIO($filePathStringBuffer3->toString(), $bufferedImageCacheables->[2]->getBufferedImage());
        }
}

# use java::awt;
# use java::awt::image::BufferedImage;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::input::automation::ImageOutputData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::number::LongUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::util::cache::AutomaticCacheInterface;
use org::allbinary::logic::util::cache::PoolInterface;
use org::allbinary::logic::visual::media::MediaDataFactory;
use org::allbinary::media::image::ImagePersistanceUtil;
use org::allbinary::media::image::cache::BufferedImageCacheable;
use org::allbinary::media::image::cache::BufferedImageInfo;
use org::allbinary::media::image::cache::BufferedImageInfoFactory;
use org::allbinary::media::image::cache::BufferedImagePoolSingleton;
use org::allbinary::media::image::comparison::ImageComparisonResult;
use org::allbinary::media::image::io::ImageIOInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::comparison::motion::AllMotionRectanglesResultsCacheSingleton;
use org::allbinary::media::image::comparison::motion::ConsolidatedMotionRectanglesResultsCacheSingleton;
use org::allbinary::media::image::comparison::motion::ConstrainedMotionRectanglesResultsCacheSingleton;
use org::allbinary::media::image::comparison::motion::Color;

1;

