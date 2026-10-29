# Generated Code Do Not Modify

#import com.sun.imageio.plugins.common.ImageUtil;
package org::allbinary::logic::visual::media::MediaUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::visual::media::MediaUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::media::MediaUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub saveImageFile {
    my ($self, $originalImageFile, $newImageFileName, $category, $mediaData, $newWidth, $newHeight) = @_;
        if (!defined($originalImageFile) || !$originalImageFile->isFile()) {
            die ("Original Image File Does Not Exist.");
        }
        my $bufferedImage = 'org::allbinary::logic::visual::media::ImageIOUtil'->read($originalImageFile);
        if (!defined($bufferedImage)) {
            die ("Unable to find ImageReader for this file.");
        }
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{VIEW})) {
            my $hashMap = $self->getImageBufferPropertyHashMap($bufferedImage);
            $self->{logUtil}->putF("Image Properties: " . $hashMap->toString(), $self, "saveImageFile()");
        }
        my $imageFile = 'org::allbinary::logic::io::file::AbFile'->createAbFile($category . $newImageFileName);
        $imageFile->createNewFile();
        my $imageUtil = 'org::allbinary::media::image::ImageUtil'->getInstance();
        my $newBufferedImage = $imageUtil->createBufferedImageForSave($bufferedImage, $newWidth, $newHeight);
        my $isWritten = 'org::allbinary::logic::visual::media::ImageIOUtil'->write($newBufferedImage, $mediaData->getName(), $imageFile);
        if (!$isWritten) {
            die ("Unable to write.");
        }
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{VIEW})) {
            my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Get Path: ");
            $stringBuffer->append($originalImageFile->getPath());
            $stringBuffer->append("\nNewImageFileName: ");
            $stringBuffer->append($newImageFileName);
            $stringBuffer->append("\nCategory: ");
            $stringBuffer->append($category);
            $stringBuffer->append("\nSave File Type: ");
            $stringBuffer->append($mediaData->getName());
            $stringBuffer->append("\nNew")->append($commonLabels->{WIDTH_LABEL});
            $stringBuffer->appendint($newWidth);
            $stringBuffer->append("\nNew")->append($commonLabels->{HEIGHT_LABEL});
            $stringBuffer->appendint($newHeight);
            $stringBuffer->append("\nFile Length: ");
            $stringBuffer->appendlong($originalImageFile->length());
            $stringBuffer->append("\nNew File Length: ");
            $stringBuffer->appendlong($imageFile->length());
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "saveImageFile()");
        }
}


sub getImageBufferPropertyHashMap {
    my ($class, $bufferedImage) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $propertyStringArray = $bufferedImage->getPropertyNames();
        if (defined($propertyStringArray)) {
            for (my $index = 0; $index < scalar(@{$propertyStringArray}); $index++) {
                my $propertyObject = $bufferedImage->getProperty($propertyStringArray->[$index]);
                $hashMap->put($propertyStringArray->[$index], $propertyObject->toString());
            }
        }
        return $hashMap;
}

# use java::awt::image::BufferedImage;
# use java::awt::image::RenderedImage;
use java::util::HashMap;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::image::ImageUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::logic::visual::media::ImageIOUtil;

1;

