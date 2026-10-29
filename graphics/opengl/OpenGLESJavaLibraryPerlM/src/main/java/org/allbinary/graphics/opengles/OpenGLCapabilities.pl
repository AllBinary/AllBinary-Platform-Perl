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

package org::allbinary::graphics::opengles::OpenGLCapabilities;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();

our $instance = 'org::allbinary::graphics::opengles::OpenGLCapabilities'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{CUSTOM_GL_SURFACE_VIEW} = 1;
    $self->{stringUtil} = 'org::allbinary::logic::string::StringUtil'->getInstance();
    $self->{initialized} = 0;
    $self->{glVersionString} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{glShaderVersionString} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{shaderVersion} = 0;
    $self->{glRenderer} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{glVendor} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{glExtensions} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{possiblyAccelerated} = 0;
    $self->{acceleratedString} = $self->{stringUtil}->{EMPTY_STRING};
    $self->{maxTextureSize} = 64;
    $self->{VERSION_1_0} = "1.0";
    $self->{VERSION_1_1} = "1.1";
    $self->{VERSION_2_0} = "2.0";
    $self->{VERSION_3_0} = "3.0";
    $self->{VERSION_3_1} = "3.1";
    $self->{VERSION_3_2} = "3.2";
    $self->{VERSION_HIGHER_THAN_EXISTS} = "999.999";
    $self->{VERSION_UNK} = "Unk";
    $self->{GL_EXT_GPU_SHADER_100} = "GL_ARB_shading_language_100";
    $self->{GL_EXT_GPU_SHADER4} = "GL_EXT_gpu_shader4";
    $self->{glVersion} = $self->{glVersionString};
    $self->{glInstanceVersion} = $self->{VERSION_UNK};
    $self->{glExtensionDrawTexture} = 0;
    $self->{glThreedDrawTexture} = 0;
    $self->{glExtensionGPUShader4} = 0;
    $self->{glExtensionGPUShader100} = 0;
    $self->{vertexBufferObjectSupport} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLCapabilities::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub isInitialized {
    my ($self) = @_;
        return $self->{initialized};
}


sub requireInitialization {
    my ($self) = @_;
}


sub initCapabilities {
    my ($self, $gl) = @_;
        my $METHOD_NAME = "initGLCapabilities";
        try {
            my $features = 'org::allbinary::game::configuration::feature::Features'->getInstance();
            my $openGLFeatureFactory = 'org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance();
            my $openGLImageSpecificFactory = 'org::allbinary::image::opengles::OpenGLImageSpecificFactory'->getInstance();
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $self->{glVersionString} = $gl->glGetString($javax::microedition::khronos::opengles::GL10::GL_VERSION);
            my $GL_SHADING_LANGUAGE_VERSION = 0x8b8c;
            $self->{glShaderVersionString} = $gl->glGetString($GL_SHADING_LANGUAGE_VERSION);
            if (!defined($self->{glShaderVersionString})) {
                $self->{glShaderVersionString} = $self->{stringUtil}->{EMPTY_STRING};
            }
            try {
                if (defined($self->{glShaderVersionString}) && index($self->{glShaderVersionString}, ".") >= 0) {
                    my $startIndex = rindex($self->{glShaderVersionString}, " ");
                    if ($startIndex >= 0) {
                        $self->{glShaderVersionString} = substr($self->{glShaderVersionString}, $startIndex + 1);
                    }
                    $self->{shaderVersion} = int(join('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, split(quotemeta('org::allbinary::string::CommonSeps'->getInstance()->{PERIOD}), $self->{glShaderVersionString}, -1)));
                }
            } catch ($e) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $METHOD_NAME, $e);
            }
            $self->{glRenderer} = $gl->glGetString($javax::microedition::khronos::opengles::GL10::GL_RENDERER);
            $self->{glVendor} = $gl->glGetString($javax::microedition::khronos::opengles::GL10::GL_VENDOR);
            $self->{glExtensions} = $gl->glGetString($javax::microedition::khronos::opengles::GL10::GL_EXTENSIONS);
            if (index($self->{glExtensions}, $self->{GL_EXT_GPU_SHADER_100}) >= 0) {
                $self->{glExtensionGPUShader100} = 1;
            } else {
                $self->{glExtensionGPUShader100} = 0;
            }
            if (index($self->{glExtensions}, $self->{GL_EXT_GPU_SHADER4}) >= 0) {
                $self->{glExtensionGPUShader4} = 1;
            } else {
                $self->{glExtensionGPUShader4} = 0;
            }
            if (!defined($self->{glRenderer})) {
                $self->{glRenderer} = $self->{stringUtil}->{EMPTY_STRING};
            }
            if (index(lc($self->{glRenderer}), "pixelflinger") >= 0) {
                $self->{acceleratedString} = "Probably Not for " . $self->{glRenderer};
                $self->{possiblyAccelerated} = 0;
            } else {
                $self->{acceleratedString} = "Probably for " . $self->{glRenderer};
                $self->{possiblyAccelerated} = 1;
            }
            $self->{glExtensionDrawTexture} = 0;
            if (!defined($self->{glVersionString})) {
                $self->{glVersionString} = $self->{stringUtil}->{EMPTY_STRING};
                $self->{glVersion} = $self->{VERSION_UNK};
            } elsif (index($self->{glVersionString}, " 1.0") >= 0) {
                $self->{glVersion} = $self->{VERSION_1_0};
            } elsif (index($self->{glVersionString}, " 1.1") >= 0) {
                $self->{glVersion} = $self->{VERSION_1_1};
            } else {
                $self->{glVersion} = $self->{VERSION_UNK};
            }
            if ((Scalar::Util::blessed($gl) && $gl->isa('javax::microedition::khronos::opengles::GL11'))) {
                $self->{glInstanceVersion} = $self->{VERSION_1_1};
            } elsif ((Scalar::Util::blessed($gl) && $gl->isa('javax::microedition::khronos::opengles::GL10'))) {
                $self->{glInstanceVersion} = $self->{VERSION_1_0};
            }
            if (!defined($self->{glVendor})) {
                $self->{glVendor} = $self->{stringUtil}->{EMPTY_STRING};
            }
            if (!defined($self->{glExtensions})) {
                $self->{glExtensions} = $self->{stringUtil}->{EMPTY_STRING};
            }
            if ($self->{possiblyAccelerated}) {
                'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("VBO:?")->appendboolean(($self->{glInstanceVersion} eq $self->{VERSION_1_1}))->append("||")->appendboolean($self->isExtension($openGLFeatureFactory->{OPENGL_VERTEX_BUFFER_OBJECT}))->toString(), $self, $METHOD_NAME);
                if (($self->{glInstanceVersion} eq $self->{VERSION_1_1} || $self->isExtension($openGLFeatureFactory->{OPENGL_VERTEX_BUFFER_OBJECT}))) {
                    if ('org::allbinary::AndroidUtil'->isAndroid()) {
                        'org::allbinary::logic::communication::log::PreLogUtil'->put("VBO implementation was detected, but disabled by default for Android", $self, $METHOD_NAME);
                    } else {
                        'org::allbinary::logic::communication::log::PreLogUtil'->put("VBO implementation was detected, but disabled for now", $self, $METHOD_NAME);
                    }
                }
            }
            my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
            if ($features->isDefault($openGLFeatureFactory->{OPENGL_AUTO_SELECT})) {
                if ($self->{vertexBufferObjectSupport}) {
                    $openGLImageSpecificFactory->setImageFactory('org::allbinary::image::opengles::OpenGLESGL11VBOImageFactory'->new());
                } else {
                    $stringBuffer->append("OpenGL is on but ");
                    $stringBuffer->append($stringUtil->toString($openGLFeatureFactory->{OPENGL_DRAW_TEXTURE}));
                    $stringBuffer->append(" was not available");
                    'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, $METHOD_NAME);
                    $openGLImageSpecificFactory->setImageFactory('org::allbinary::image::opengles::OpenGLESGL10ImageFactory'->new());
                }
            } else {
                $stringBuffer->append($stringUtil->toString($openGLFeatureFactory->{OPENGL_AUTO_SELECT}));
                $stringBuffer->append(" is not on");
                'org::allbinary::logic::communication::log::PreLogUtil'->put($stringBuffer->toString(), $self, $METHOD_NAME);
                $openGLImageSpecificFactory->setImageFactory('org::allbinary::image::opengles::OpenGLESGL10ImageFactory'->new());
            }
            my $maxTextureSizeArray = [(0) x (1)];
            $gl->glGetIntegerv($javax::microedition::khronos::opengles::GL10::GL_MAX_TEXTURE_SIZE, $maxTextureSizeArray, 0);
            $self->{maxTextureSize} = $maxTextureSizeArray->[0];
            $self->{initialized} = 1;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $METHOD_NAME, $e);
        }
}


sub isExtension {
    my ($self, $gameFeature) = @_;
        my $index = index($self->{glExtensions}, $gameFeature->getName());
        if ($index >= 0) {
            return 1;
        } else {
            return 0;
        }
}


sub isGlExtensionDrawTexture {
    my ($self) = @_;
        $self->requireInitialization();
        return $self->{glExtensionDrawTexture};
}


sub isGlExtensionGPUShader100 {
    my ($self) = @_;
        return $self->{glExtensionGPUShader100};
}


sub isGlExtensionGPUShader4 {
    my ($self) = @_;
        $self->requireInitialization();
        return $self->{glExtensionGPUShader4};
}


sub getGlVersion {
    my ($self) = @_;
        $self->requireInitialization();
        return $self->{glVersion};
}


sub getGlVersionString {
    my ($self) = @_;
        $self->requireInitialization();
        return $self->{glVersionString};
}


sub getGlShaderVersion {
    my ($self) = @_;
        $self->requireInitialization();
        return $self->{glShaderVersionString};
}


sub isGlThreedDrawTexture {
    my ($self) = @_;
        $self->requireInitialization();
        return $self->{glThreedDrawTexture};
}


sub getGlRenderer {
    my ($self) = @_;
        $self->requireInitialization();
        return $self->{glRenderer};
}


sub isVertexBufferObjectSupport {
    my ($self) = @_;
        $self->requireInitialization();
        return $self->{vertexBufferObjectSupport};
}


sub isTextureSizeValid {
    my ($self, $widthAndHeight) = @_;
        $self->requireInitialization();
        if ($self->{maxTextureSize} >= $widthAndHeight) {
            return 1;
        }
        return 0;
}


sub toString {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("GL_VERSION: ");
        $stringBuffer->append($self->{glVersionString});
        $stringBuffer->append(" GL_SHADING_LANGUAGE_VERSION: ");
        $stringBuffer->append($self->{glShaderVersionString});
        $stringBuffer->append(" GL_RENDERER: ");
        $stringBuffer->append($self->{glRenderer});
        $stringBuffer->append(" GL_VENDOR: ");
        $stringBuffer->append($self->{glVendor});
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append(" Is Accelerated: ");
        $stringBuffer->append($self->{acceleratedString});
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append(" VBO Support: ");
        $stringBuffer->appendboolean($self->isVertexBufferObjectSupport());
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append(" Max Texture Size: ");
        $stringBuffer->appendint($self->{maxTextureSize});
        $stringBuffer->append($commonSeps->{NEW_LINE});
        $stringBuffer->append(" GL_EXTENSIONS: ");
        try {
            my $tokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new($commonSeps->{SPACE});
            my $list = $tokenizer->getTokensFromString($self->{glExtensions}, 'org::allbinary::util::BasicArrayListD'->new());
            my $size = $list->size();
            for (my $index = 0; $index < $size; $index++) {
                $stringBuffer->append($commonSeps->{NEW_LINE});
                $stringBuffer->append($self->{stringUtil}->toString($list->{objectArray}->[$index]));
            }
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE($commonStrings->{EXCEPTION}, $self, $commonStrings->{TOSTRING}, $e);
        }
        return $stringBuffer->toString();
}

# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::khronos::opengles::GL11;
use org::allbinary::AndroidUtil;
use org::allbinary::image::opengles::OpenGLESGL10ImageFactory;
use org::allbinary::image::opengles::OpenGLESGL11VBOImageFactory;
use org::allbinary::image::opengles::OpenGLImageSpecificFactory;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::tokens::Tokenizer;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;

1;

