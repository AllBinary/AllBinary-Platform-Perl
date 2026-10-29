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

package org::allbinary::image::opengles::OpenGLESGL10Image;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::image::opengles::OpenGLESImage';


sub _init_fields {
    my ($self) = @_;
    $self->{textureVertexFloatBuffer} = 'java::nio::ByteBuffer'->allocateDirect(4 * 4 * 2)->order('java::nio::ByteOrder'->nativeOrder())->asFloatBuffer();
    $self->{realOpenGLESImageDraw} = do {
        package org::allbinary::image::opengles::OpenGLESImageDraw::AnonymousN66017 { our @ISA = ('org::allbinary::image::opengles::OpenGLESImageDraw');
        $self->{glUtil} = 'org::allbinary::opengles::GLUtil'->getInstance();
        $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $self->{textureVertexFloatBuffer} = $self->{textureVertexFloatBuffer};
        $self->{regionTextureRectangleFloatArray} = [(0.0) x (8)];
        $self->{regionTextureVertexFloatBuffer} = 'java::nio::ByteBuffer'->allocateDirect(4 * 4 * 2)->order('java::nio::ByteOrder'->nativeOrder())->asFloatBuffer();
        $self->{regionRectangleFloatArray} = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
        $self->{regionRectangleVertexFloatBuffer} = 'java::nio::ByteBuffer'->allocateDirect(4 * 4 * 3)->order('java::nio::ByteOrder'->nativeOrder())->asFloatBuffer();
        $self->{openGLESImageProperties} = $self->{openGLESImageProperties};
        

        sub drawRegion {
            my ($self, $gl, $viewHeight, $x_src, $y_src, $width, $height, $x, $y, $z) = @_;
            my $imageWidth = $self->getWidth();
            my $imageHeight = $self->getHeight();
            $self->{regionRectangleFloatArray}->[7] = $viewHeight;
            $self->{regionRectangleFloatArray}->[1] = $self->{regionRectangleFloatArray}->[7] - $height;
            $self->{regionRectangleFloatArray}->[3] = $width;
            $self->{regionRectangleFloatArray}->[4] = $self->{regionRectangleFloatArray}->[1];
            $self->{regionRectangleFloatArray}->[9] = $self->{regionRectangleFloatArray}->[3];
            $self->{regionRectangleFloatArray}->[10] = $self->{regionRectangleFloatArray}->[7];
            $self->{regionTextureRectangleFloatArray}->[0] = $x_src / $imageWidth;
            $self->{regionTextureRectangleFloatArray}->[1] = (($y_src + $height)) / $imageHeight;
            $self->{regionTextureRectangleFloatArray}->[2] = (($x_src + $width)) / $imageWidth;
            $self->{regionTextureRectangleFloatArray}->[3] = $self->{regionTextureRectangleFloatArray}->[1];
            $self->{regionTextureRectangleFloatArray}->[4] = $self->{regionTextureRectangleFloatArray}->[0];
            $self->{regionTextureRectangleFloatArray}->[5] = $y_src / $imageHeight;
            $self->{regionTextureRectangleFloatArray}->[6] = $self->{regionTextureRectangleFloatArray}->[2];
            $self->{regionTextureRectangleFloatArray}->[7] = $self->{regionTextureRectangleFloatArray}->[5];
            my $u_center = ($self->{regionTextureRectangleFloatArray}->[0] + $self->{regionTextureRectangleFloatArray}->[2]) / 2.0;
            my $v_center = ($self->{regionTextureRectangleFloatArray}->[5] + $self->{regionTextureRectangleFloatArray}->[1]) / 2.0;
            $self->{glUtil}->rotateUVs($self->{regionTextureRectangleFloatArray}, -$self->{openGLESImageProperties}->{angle}, $u_center, $v_center);
            $gl->glPushMatrix();
            my $imageProcessor = $self->{imageProcessor};
            $self->{openGLESImageTranslate}->translate($gl, $self, $x, -$y);
            $imageProcessor->scale($gl, $self->{openGLESImageProperties}->{scaleX}, $self->{openGLESImageProperties}->{scaleY});
            $imageProcessor->colorMask($gl, $self->{openGLESImageProperties}->{redf}, $self->{openGLESImageProperties}->{greenf}, $self->{openGLESImageProperties}->{bluef}, $self->{openGLESImageProperties}->{alphaf});
            $self->{openGLESImageTranslate}->translate2($gl, $self);
            $self->{regionRectangleVertexFloatBuffer}->put($self->{regionRectangleFloatArray});
            $self->{glUtil}->position($self->{regionRectangleVertexFloatBuffer}, 0);
            $gl->glVertexPointer(3, $javax::microedition::khronos::opengles::GL10::GL_FLOAT, 0, $self->{regionRectangleVertexFloatBuffer});
            $gl->glEnableClientState($javax::microedition::khronos::opengles::GL10::GL_VERTEX_ARRAY);
            $gl->glEnable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
            $gl->glBindTexture($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, $self->{openGLESImageProperties}->{textureID});
            $gl->glEnableClientState($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_COORD_ARRAY);
            $self->{regionTextureVertexFloatBuffer}->put($self->{regionTextureRectangleFloatArray});
            $self->{glUtil}->position($self->{regionTextureVertexFloatBuffer}, 0);
            $gl->glTexCoordPointer(2, $javax::microedition::khronos::opengles::GL10::GL_FLOAT, 0, $self->{regionTextureVertexFloatBuffer});
            $gl->glDrawArrays($javax::microedition::khronos::opengles::GL10::GL_TRIANGLE_STRIP, 0, 4);
            $gl->glDisableClientState($javax::microedition::khronos::opengles::GL10::GL_VERTEX_ARRAY);
            $gl->glDisableClientState($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_COORD_ARRAY);
            $gl->glDisable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
            $gl->glPopMatrix();
        }
        

        sub draw {
            my ($self, $gl, $x, $y, $z) = @_;
            my $width = $self->getWidth();
            my $height = $self->getHeight();
            $self->{regionRectangleFloatArray}->[7] = $self->{displayInfoSingleton}->getLastHeight();
            $self->{regionRectangleFloatArray}->[1] = $self->{regionRectangleFloatArray}->[7] - $height;
            $self->{regionRectangleFloatArray}->[3] = $width;
            $self->{regionRectangleFloatArray}->[4] = $self->{regionRectangleFloatArray}->[1];
            $self->{regionRectangleFloatArray}->[9] = $self->{regionRectangleFloatArray}->[3];
            $self->{regionRectangleFloatArray}->[10] = $self->{regionRectangleFloatArray}->[7];
            $self->{regionTextureRectangleFloatArray}->[0] = 0;
            $self->{regionTextureRectangleFloatArray}->[1] = 1;
            $self->{regionTextureRectangleFloatArray}->[2] = 1;
            $self->{regionTextureRectangleFloatArray}->[3] = 1;
            $self->{regionTextureRectangleFloatArray}->[4] = 0;
            $self->{regionTextureRectangleFloatArray}->[5] = 0;
            $self->{regionTextureRectangleFloatArray}->[6] = 1;
            $self->{regionTextureRectangleFloatArray}->[7] = 0;
            $gl->glPushMatrix();
            $self->{openGLESImageTranslate}->translate($gl, $self, $x, -$y);
            my $imageProcessor = $self->{imageProcessor};
            $imageProcessor->scale($gl, $self->{openGLESImageProperties}->{scaleX}, $self->{openGLESImageProperties}->{scaleY});
            $imageProcessor->colorMask($gl, $self->{openGLESImageProperties}->{redf}, $self->{openGLESImageProperties}->{greenf}, $self->{openGLESImageProperties}->{bluef}, $self->{openGLESImageProperties}->{alphaf});
            $self->{openGLESImageTranslate}->translate2($gl, $self);
            $self->{regionRectangleVertexFloatBuffer}->put($self->{regionRectangleFloatArray});
            $self->{glUtil}->position($self->{regionRectangleVertexFloatBuffer}, 0);
            $gl->glVertexPointer(3, $javax::microedition::khronos::opengles::GL10::GL_FLOAT, 0, $self->{regionRectangleVertexFloatBuffer});
            $gl->glEnableClientState($javax::microedition::khronos::opengles::GL10::GL_VERTEX_ARRAY);
            $gl->glEnable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
            $gl->glBindTexture($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, $self->{openGLESImageProperties}->{textureID});
            $gl->glEnableClientState($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_COORD_ARRAY);
            $self->{glUtil}->rotateUVs($self->{regionTextureRectangleFloatArray}, -$self->{openGLESImageProperties}->{angle}, 0.5, 0.5);
            $self->{glUtil}->position($self->{textureVertexFloatBuffer}, 0);
            $self->{textureVertexFloatBuffer}->put($self->{regionTextureRectangleFloatArray});
            $self->{glUtil}->position($self->{textureVertexFloatBuffer}, 0);
            $gl->glTexCoordPointer(2, $javax::microedition::khronos::opengles::GL10::GL_FLOAT, 0, $self->{textureVertexFloatBuffer});
            $gl->glDrawArrays($javax::microedition::khronos::opengles::GL10::GL_TRIANGLE_STRIP, 0, 4);
            $gl->glDisableClientState($javax::microedition::khronos::opengles::GL10::GL_VERTEX_ARRAY);
            $gl->glDisableClientState($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_COORD_ARRAY);
            $gl->glDisable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
            $gl->glPopMatrix();
        }
        }
        'org::allbinary::image::opengles::OpenGLESImageDraw::AnonymousN66017'->can('new') ? 'org::allbinary::image::opengles::OpenGLESImageDraw::AnonymousN66017'->new() : bless({}, 'org::allbinary::image::opengles::OpenGLESImageDraw::AnonymousN66017')
    };
    $self->{openGLESImageDraw} = 'org::allbinary::image::opengles::OpenGLESImageDraw'->getInstance();
}


sub new {
    my ($class, $image, $bitmapFactory, $textureFactory) = @_;
    my $self = $class->SUPER::new($image, $bitmapFactory, $textureFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->initVertices();
    return $self;
}


sub initVertices {
    my ($self) = @_;
        $self->{textureVertexFloatBuffer}->put(0);
        $self->{textureVertexFloatBuffer}->put(1);
        $self->{textureVertexFloatBuffer}->put(1);
        $self->{textureVertexFloatBuffer}->put(1);
        $self->{textureVertexFloatBuffer}->put(0);
        $self->{textureVertexFloatBuffer}->put(0);
        $self->{textureVertexFloatBuffer}->put(1);
        $self->{textureVertexFloatBuffer}->put(0);
        $self->{textureVertexFloatBuffer}->rewind();
}


sub set {
    my ($self, $gl) = @_;
        my $gl10 = $gl;
        if ($self->SUPER::initTexture($gl10)) {
            $self->{textureFactory}->load($gl10, $javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, 0, $self, 0, 1);
            $gl10->glDisable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
            $self->{openGLESImageDraw} = $self->{realOpenGLESImageDraw};
            'org::allbinary::graphics::opengles::OpenGLLogUtil'->getInstance()->logError($gl10, $self);
        }
}


sub drawRegion {
    my ($self, $gl, $viewHeight, $x_src, $y_src, $width, $height, $x, $y, $z) = @_;
        $self->{openGLESImageDraw}->drawRegion($gl, $viewHeight, $x_src, $y_src, $width, $height, $x, $y, $z);
}


sub draw {
    my ($self, $gl, $x, $y, $z) = @_;
        $self->{openGLESImageDraw}->draw($gl, $x, $y, $z);
}

# use java::nio::ByteBuffer;
# use java::nio::ByteOrder;
# use java::nio::FloatBuffer;
# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::opengles::OpenGLLogUtil;
use org::allbinary::opengles::GLUtil;
use org::allbinary::platform::graphics::PlatformBitmapBaseFactory;
use org::allbinary::platform::opengles::PlatformTextureBaseFactory;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::image::opengles::OpenGLESImageDraw;

1;

