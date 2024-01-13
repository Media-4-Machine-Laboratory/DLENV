echo "Install FRNN Module"

git clone --recursive https://github.com/lxxue/FRNN.git
cd /FRNN/external/prefix_sum
python -m pip install .
cd /FRNN
python -m pip install -e .

echo "Install PyMesh"
cd /
git clone https://github.com/PyMesh/PyMesh.git
cd /PyMesh
git submodule update --init
export PYMESH_PATH="/PyMesh"

python -m pip install -r ${PYMESH_PATH}/python/requirements.txt

echo "Install NeRF-Texture"
cd /
python -m pip install fvcore iopath
python -m pip install scikit-learn scikit-image matplotlib imageio plotly opencv-python
python -m pip install black usort flake8 flake8-bugbear flake8-comprehensions
python -m pip install git+https://github.com/facebookresearch/pytorch3d.git
python -m pip install git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch
python -m pip install git+https://github.com/ashawkey/cubvh

mkdir /src
cd /src
git clone https://github.com/yihua7/NeRF-Texture
cd /src/NeRF-Texture/raymarching
python setup.py build_ext --inplace
python -m pip install .

cd /src/NeRF-Texture/gridencoder
python setup.py build_ext --inplace
python -m pip install .

cd /src/NeRF-Texture/external/RayTracer
python setup.py develop

cd /src/NeRF-Texture
python -m pip install -r requirements.txt