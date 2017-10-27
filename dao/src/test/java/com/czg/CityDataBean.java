package com.czg;

import java.util.List;

public class CityDataBean {


    private List<ProvinceBean> province;

    public List<ProvinceBean> getProvince() {
        return province;
    }

    public void setProvince(List<ProvinceBean> province) {
        this.province = province;
    }

    public static class ProvinceBean {


        private String name;
        private List<CityBean> city;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public List<CityBean> getCity() {
            return city;
        }

        public void setCity(List<CityBean> city) {
            this.city = city;
        }

        public static class CityBean {


            private String name;
            private List<DistrictBean> district;

            public String getName() {
                return name;
            }

            public void setName(String name) {
                this.name = name;
            }

            public List<DistrictBean> getDistrict() {
                return district;
            }

            public void setDistrict(List<DistrictBean> district) {
                this.district = district;
            }

            @Override
            public String toString() {
                return "CityBean{" +
                        "name='" + name + '\'' +
                        ", district=" + district +
                        '}';
            }

            public static class DistrictBean {


                private String name;
                private String zipcode;

                public String getName() {
                    return name;
                }

                public void setName(String name) {
                    this.name = name;
                }

                public String getZipcode() {
                    return zipcode;
                }

                public void setZipcode(String zipcode) {
                    this.zipcode = zipcode;
                }

                @Override
                public String toString() {
                    return "DistrictBean{" +
                            "name='" + name + '\'' +
                            ", zipcode='" + zipcode + '\'' +
                            '}';
                }
            }
        }
    }
}
