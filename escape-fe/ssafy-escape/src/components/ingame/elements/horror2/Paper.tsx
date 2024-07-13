import { useGLTF } from "@react-three/drei"

interface PaperProps {
  twoMinLater: boolean
}

const Paper = ({ twoMinLater }: PaperProps) => {
  const paper = useGLTF(
    IMAGE_URL.RESOURCE + "/glb/horror2/paper.glb",
    true,
  )
  const horrorPaper = useGLTF(
    IMAGE_URL.RESOURCE + "/glb/horror2/after_paper.glb",
    true,
  )
  return (
    <>
      {twoMinLater ? (
        <primitive object={horrorPaper.scene} scale={35} />
      ) : (
        <primitive object={paper.scene} scale={35} />
      )}
    </>
  )
}

export default Paper
